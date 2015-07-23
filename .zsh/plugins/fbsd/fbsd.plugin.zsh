function poud_builds_nuke () {

  sudo find $_poudriere_data -type d -a \( -name "*i386*" -o -name "*amd64*"  -o -name latest-per-pkg \) | xargs sudo rm -rf
  sudo rm -rf $_poudriere_data/logs/bulk/.data.json
}

function poud_diff () {

  git diff `git svn dcommit -n | grep '^diff-tree'| cut -f 2,3 -d" "`
}

function poud_ci () {
  local pr=$1

  local d=$(_bz_pr_dir $pr)

  local cif=$d/msg

  local title="$(cat $d/title)"
  local port=$(cat $d/port)
  local reporter=$(cat $d/reporter)
  local maintainer=$(cat $d/maintainer)
  local is_maintainer=$(_bz_is_maintainer $reporter $maintainer)
  local days=$(_bz_timeout_from_pr $pr)
  local update="$(cat $d/update)"

  local submitted_by=""
  local approved_by=""
  if [ $is_maintainer -eq 1 ]; then
    submitted_by="$reporter (maintainer)"
  else
    submitted_by="$reporter"
    if [ x"$days" != x"" -a $maintainer != "ports@FreeBSD.org" ]; then
      approved_by="maintainer timeout ($maintainer ; $days days)"
    else
      approved_by="$maintainer (maintainer)"
    fi
  fi

  if [ x"$update" != x"" ]; then
    title="$port: $update"
  fi

  cat <<EOF > $cif
$title

-

PR:                  $pr
Submitted by:        $submitted_by
Approved by:         $approved_by
EOF

  ( cd $PORTSDIR/$port ; git add -A .)
  ( cd $PORTSDIR/$port ; git commit -F $cif)
}

# ----------------------------------------------------------------------------
_pybugz_dir=$_rdir/pybugz
_pybugz=$_pybugz_dir/bin/bugz
PYTHONPATH=$_pybugz_dir:$PYTHONPATH; export PYTHONPATH

_bz=$_pybugz

function _bz_pr_dir () {
  local pr=$1

  local d=/tmp/fbsd/$pr
  if [ ! -d $d ]; then
    mkdir -p $d
  fi

  echo $d
}

function _bz_get_attachment () {
  local pr=$1

  local d=$(_bz_pr_dir $pr)
  local id=0

  local a_cnt=$(grep Attachments $d/info | cut -d: -f2 | sed -e 's, ,,g')
  if [ $a_cnt -gt 0 ]; then
    local id=$(grep "\[Attachment\]" $d/info | egrep -i 'shar|diff|patch|shell|update' | awk '{ print $2 }' | sed -e 's,\[,,' -e 's,\],,' | sort -n | tail -1 )
    fetch -q -o $d/patch "https://bz-attachments.freebsd.org/attachment.cgi?id=$id"
    local s_cnt=$(head -1 $d/patch | grep -c "# This is a shell archive.")
    echo $s_cnt > $d/shar
  fi
}

function _bz_is_timeout () {
  local created=$1

  local ethen=$(date -j -f "%Y%m%d" "$created" "+%s")
  local enow=$(date -j -f "%a %b %d %T %Z %Y" "`date`" "+%s")
  local days=$(printf "%.0f" $(echo "scale=2; ($enow - $ethen)/(60*60*24)" | bc))

  echo $days
}

function _bz_timeout_from_pr () {
  local pr=$1

  local d=$(_bz_pr_dir $pr)

  local str="$(grep "Maintainer Timeout -" $d/info | awk -F'-' '{ print $2 }' | sed -e 's,^ *,,')"

  echo $str
}

function _bz_is_maintainer () {
  local reporter=$1
  local maintainer=$2

  [ $reporter != $maintainer ]
  echo $?
}

function _bz_is_update () {
  local pr=$1

  local d=$(_bz_pr_dir $pr)
  local port=$(cat $d/port)

  local p1=$(cd $PORTSDIR/$port ; git diff | grep PORTVERSION | head -1 | awk '{print $2}')
  local p2=$(cd $PORTSDIR/$port ; git diff | grep PORTVERSION | tail -1 | awk '{print $2}')

  if [ $p1 != $p2 ]; then
    echo "$p1 -> $p2" > $d/update
  else
    touch $d/update
  fi
}

function _bz_get_maintainer () {
  local port=$1

  if [ -d $PORTSDIR/$port ]; then
   echo $(cd $PORTSDIR/$port ; make -V MAINTAINER)
  fi
}

function _bzget () {
set -x
  local pr=$1

  local d=$(_bz_pr_dir $pr)

  $_bz get $pr > $d/info

  local title="$(grep Title $d/info |cut -d: -f 2- |sed -e 's,^ *,,')"
  local port=$(echo $title| egrep -o "[_a-zA-Z0-9\-]*/[_a-zA-Z0-9\-]*" | head -1)
  local reporter=$(awk -F': ' '/Reporter/ { print $2 }' $d/info)
  local created=$(awk -F': '  '/Reported/ { print $2 }' $d/info | sed -e 's,T.*,,')
  local maintainer=$(_bz_get_maintainer $port)
  local days=$(_bz_is_timeout $created)
  _bz_get_attachment $pr

  echo $title         > $d/title
  echo $port          > $d/port
  echo $reporter      > $d/reporter
  echo $created       > $d/created
  echo $maintainer    > $d/maintainer

  if [ -n $days -a $days -gt 14 ]; then
    echo $days > $d/days
  else
    touch $d/days
  fi
}

function bzlogin () {
  $_bz login
}

function bztake () {
  local pr=$1

  $_bz modify -a $USER@freebsd.org -s Open -c "Take." $pr
}

function bzinprog () {
  local pr=$1

  $_bz modify -s 'In Progress' $pr

  _bzget $pr
}

function bzmine () {
  local pr=$1

  bztake $pr
  bzinprog $pr
}

function bztimeout () {
  local pr=$1

  local d=$(_bz_pr_dir $pr)

  local days=$(cat $d/days)
  local maintainer=$(cat $d/maintainer)

  if [ -n "$days" ]; then
    $_bz modify -c "Maintainer Timeout - $days days ($maintainer)" $pr
  fi

  _bzget $pr
}

function bzpatch () {
set -x
  local pr=$1

  [ -z $PORTSDIR ] && _poud_msg "must call poud_ptree foo 1st" && return

  local d=$(_bz_pr_dir $pr)
  local is_shar=$(cat $d/shar)

  if [ -e $d/patch ]; then
    if [ $is_shar -eq 1 ]; then
      _bzpatch_shar $pr
    else
      _bzpatch_patch $pr
    fi
  fi
}

function _bzpatch_patch () {
  local pr=$1

  local d=$(_bz_pr_dir $pr)
  local port=$(cat $d/port)
  local l=$(egrep "^Index:|^diff |^--- " $d/patch | head -1 | awk '{ print gsub(/\//,"") }')
  local p

  if grep -q ^diff $d/patch; then
    p="-p$(($l/2))"
  else
    p="-p$l"
  fi

  ( cd $PORTSDIR/$port ; patch $p < $d/patch )
  find $PORTSDIR/$port -type f -a \( -name "*.rej" -o -name "*.orig" \) -print -exec rm -f "{}" \;
  ( cd $PORTSDIR/$port ; find . -type f -empty | xargs git rm -rf)
  _bz_is_update $pr
}

function _bzpatch_shar () {
  local pr=$1

  local d=$(_bz_pr_dir $pr)
  local port=$(cat $d/port)

  local l=$(grep /Makefile $d/patch | head -1 | awk '{ print gsub(/\//,"") }')
  if [ $l -eq 1 ]; then
    local category=$(awk '/^XCATEGORIES=/ { print $2 }' $d/patch)
    mkdir -p $d/extract
    (cd $d/extract ; sh $d/patch)
    mkdir -p $PORTSDIR/$category/$port/
    cp -R $d/extract/* $PORTSDIR/$category/$port
  else
    sed -i'' -e 's,/usr/ports/,,' $d/patch
    (cd $PORTSDIR ; sh $d/patch)
  fi
}

function bzoverto () {
  local pr=$1
  local owner=$2
  local reason=$3

  $_bz modify -a $owner@FreeBSD.org -c "Over to $owner $reason" -s Open $pr
}

function bzclose () {
  local pr=$1

  $_bz modify -s 'Closed' -r FIXED $pr

  local d=$(_bz_pr_dir $pr)
  rm -rf $d
}

function bztop () {
  local field=$1
  local limit=${2:-10}

  local pos=-1
  case $field in
    asignee) pos=2 ;;
    reporter) pos=3 ;;
  esac

  $_bz --encoding=utf8 search -s New --product "Ports & Packages" | awk "{ print \$$pos }" | sort | uniq -c | sort -nr -k 1,1 | head -$limit
}

function bzlist () {
  local str="$1"

  $_bz --encoding=utf8 search --product "Ports & Packages" -s New -s Open -s "In Progress" "$*"
}

# ----------------------------------------------------------------------------
function poud_ps_try () {
  local maintainer=$1

  curl -s http://portscout.freebsd.org/$maintainer@freebsd.org.html | while read row; do
    if ! $(echo $row | grep -q resultsrow); then
      continue
    fi
    local port=$(echo $row | sed -e 's,.*/www.freshports.org/,,' -e 's,/".*,,')
    local new=$(echo $row | sed -e 's,</a></td><td>2015.*$,,' -e 's,.*>,,')
    if [ x"$new" = x"" ]; then
      continue
    fi

    echo "$port -> $new"
    (
      cd $PORTSDIR/$port
      perl -pi -e "s/^PORTVERSION=.*/PORTVERSION=\t$new/" Makefile
      sed -i '' -e '/PORTREVISION/d' Makefile
      make makesum
    )
  done
}

function poud_rg_license () {

  ip dir rubygem- | while read port; do
    local ver=$(awk -F\= '/^PORTVERSION=/ { print $2 }' < $PORTSDIR/$port/Makefile | perl -p -e 's,[\t\s]*,,g')
    local gem=$(echo $port | sed -e 's,rubygem-,,' -e 's,.*/,,' -e 's,[0-9]*$,,')
    local license="$(curl -s https://rubygems.org/gems/$gem/versions/$ver | \
                         grep -A3 License | \
                         grep "<p>" | \
                         sed -e 's,<p>,,' -e 's,</p>,,' -e 's,[\. \-\,]*,,g' | \
                         sed
                              -e 's,LGPL30,LGPL3,' \
                              -e 's,ISC,ISCL,'  \
                              -e 's,APACHE.*2.,APACHE20,' \
                              -e 's,^BSD$,BSD3,' \
                              -e 's,LGPLV21ORLATER,LGPL21 LGPL3,'| \
                         tr 'a-z' 'A-Z')"

    echo "$port@$ver -> $license"

    if [ x"$license" != x"N/A" -a x"$license" != x"" ]; then
        local l_cnt=$(grep -c LICENSE $PORTSDIR/$port/Makefile)
        if [ $l_cnt -gt 0 ]; then
          perl -pi -e "s/^LICENSE=.*/LICENSE=\t$license/" $PORTSDIR/$port/Makefile
        else
          perl -pi -e "s/^(COMMENT=.*)/\1\nLICENSE=.*/LICENSE=\t$license/" $PORTSDIR/$port/Makefile
        fi
    fi
  done
}
