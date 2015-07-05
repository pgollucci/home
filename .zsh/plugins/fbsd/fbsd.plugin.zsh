_rdir=$HOME/repos/fbsd
if [ -d $_rdir ]; then
  _zpool=$(awk -F= '/ZPOOL/ {print $2}' $_rdir/poudriere/src/etc/poudriere.conf)
  _zports=$(awk -F= '/ZPORTS/ {print $2}' $_rdir/poudriere/src/etc/poudriere.conf)
  _poudriere_dir=/usr/local/poudriere
  _poudriere_data=$_poudriere_dir/data
  _poudriere_ports=$_poudriere_dir/ports

  _arches="i386 amd64"
  _build_tags="8.4-RELEASE 9.3-RELEASE 10.1-RELEASE 11.0-CURRENT"

  alias cdpdir='cd $PORTSDIR'
  for d in `cd $_rdir ; /bin/ls -1d *`; do
    alias cd$d="cd $_rdir/$d"
  done
else
  return
fi

function _poud_transliterate_port () {
  local port=$1

  echo $port | sed -e 's,[/ ],_,g'
}

function _poud_from_dir_or_arg () {
  local port=$1

  if [ -z $port ]; then
    port=$(echo `pwd` | sed -e "s,$PORTSDIR/,,")
  fi

  echo $port
}

function poud_packages () {

  if [ `id -u` != 0 ]; then
    echo "need to be root"
    return
  fi

  pkg delete -af -y
  pkg bootstrap -y
  pkg install -y \
      automake bash-static dialog4ports emacs-nox11 git-subversion \
      hub libtool nginx portlint python34 ruby21-gems rsync sudo \
      swaks tmux vim-lite zsh
}

function poud_jails_delete () {

  for tag in ${=_build_tags}; do
    build=$(echo $tag | sed -e 's,-.*,,' -e 's,\.,,g')
    for arch in ${=_arches}; do
      sudo poudriere jail -d -j $build$arch
    done
  done
}

function poud_jails_create () {

  for tag in ${=_build_tags}; do
    build=$(echo $tag | sed -e 's,-.*,,' -e 's,\.,,g')
    for arch in ${=_arches}; do
      sudo poudriere jail -c -j $build$arch -v $tag -a $arch
    done
  done
}

function poud_jails_update () {

  for tag in ${=_build_tags}; do
    build=$(echo $tag | sed -e 's,-.*,,' -e 's,\.,,g')
    for arch in ${=_arches}; do
      sudo poudriere jail -u -j $build$arch
    done
  done
}

function poud_ptree_init () {

  if [ -z $PORTSDIR -o -z $_pdir ]; then
      echo "must call `pdir foo` 1st"
      return
  fi

  git_repo=git@github.com:$USER/freebsd-ports.git
  git_svn_uri=svn.freebsd.org/ports
  svn_proto=svn+ssh

  zdir=$_zports/poudriere/ports/$_pdir

  sudo zfs destroy -fr $zdir
  sudo zfs create $zdir
  sudo zfs set mountpoint=$PORTSDIR $zdir

  sudo chown $USER:$USER $PORTSDIR
  git clone $git_repo $PORTSDIR

  cd $PORTSDIR
  git svn init -T head $svn_proto://$git_svn_uri .

  git config oh-my-zsh hide-dirty 1

    cat <<EOF
EOF >> .git/config
[remote "origin"]
        fetch = +refs/pull/*:refs/remotes/origin/pull/*
EOF

    git update-ref refs/remotes/origin/trunk `git show-ref origin/svn_head | cut -d" " -f1`
    git svn fetch

    git checkout trunk
    git branch -D master
    git checkout -b master trunk

    git svn rebase
    git remote add upstream git@github.com:freebsd/freebsd-ports.git
    git branch --set-upstream-to=origin/master master
}

function poud_ptree () {
  local tree=$1

  [ -n "$tree" ] && \
      PORTSDIR=$_poudriere_ports/$tree && export PORTSDIR && \
      _pdir=$tree && export _pdir

  echo $PORTSDIR
}
poud_ptree default

function poud_mfi () {

  cd $PORTSDIR ; make fetchindex
}

function _poud_append_file () {
  local dir=$1
  local modified=$2

  case $modifier in
    M) out=$(echo $dir | sed -e 's,/usr/ports/,,' -e 's,$,/Makefile,') ;;
    P) out=$(echo $dir | sed -e 's,/usr/ports/,,' -e 's,$,/pkg-plist,') ;;
    D) out=$(echo $dir | sed -e 's,/usr/ports/,,' -e 's,$,/pkg-descr,') ;;
  esac

  echo $out
}

alias ip="poud_pi"
function poud_pi () {
  local field=$1
  local regex=$2
  local modifier=$3

  local pos=-1

  case $field in
    name)        pos=1;;
    dir)         pos=2;;
    prefix)      pos=3;;
    comment)     pos=4;;
    desc)        pos=5;;
    maintainer)  pos=6;;
    categories)  pos=7;;
    build)       pos=8;;
    run)         pos=9;;
    www)         pos=10;;
    extract)     pos=11;;
    patch)       pos=12;;
    fetch)       pos=13;;
  esac

  regex=$(echo $regex | sed -e 's,/,\\/,g')

  index_file=$PORTSDIR/INDEX-11

  if [ $field = "deps" ]; then
      out=$(awk -F'|' "\$8 ~ /$regex/ || \$9 ~ /$regex/ || \$11 ~ /$regex/ || \$12 ~ /$regex/ || \$13 ~ /$regex/ { print \$2 }" $index_file)
  else
    out=$(awk -F'|' "\$$pos ~ /$regex/ { print \$2 }" $index_file)
  fi

  _poud_append_file $out
}

function poud_pkg_to_port {
  local pkg=$1
  local modifier=$2

  out=$(awk -F\| "\$1 ~ /$pkg/ { print \$2 }" $PORTSDIR/INDEX-11 | sed -e "s,/usr/ports/,,")

  _poud_append_file $out
}

function poud_go () {
  local port=$1

  dir=$(poud_pi dir $port | head -1)
  cd $PORTSDIR/$dir
}

function poud_uses () {
  local str=$1
  local pattern=${2:-USE}

  (cd $PORTSDIR ; poud_pi deps $str M | xargs grep $pattern |grep $str)
}

function poud_aws_request_spot_instances () {
  local build=$1

  local _ami_id=ami-395c9e52
  local _ami_type=r3.8xlarge
  local _ami_sg=sg-76ff1811
  local _ami_subnet=subnet-614f3b38
  local _ami_bid=2.00

  json="{\"ImageId\":\"$_ami_id\",\"InstanceType\":\"$_ami_type\",\"NetworkInterfaces\":[{\"Groups\":[\"$_ami_sg\"],\"DeviceIndex\":0,\"SubnetId\":\"$_ami_subnet\",\"AssociatePublicIpAddress\":true}]}"

  sir=$(aws ec2 request-spot-instances --spot-price "$_ami_bid" --instance-count 1 --type "one-time" --launch-specification "$json" | awk -F: '/SpotInstanceRequestId/ { gsub(/[", ]/, "", $2); print $2}')

  echo $sir
}

function poud_aws_spot_fulfilled () {
  local sir=$1

  echo -n "Waiting....."
  code=$(aws ec2 describe-spot-instance-requests --spot-instance-request-ids $sir | awk -F: '/Code/ { gsub(/[", ]/, "", $2); print $2}')
  while [ $code != "fulfilled" ]; do
    echo "$code: `date`"
    code=$(aws ec2 describe-spot-instance-requests --spot-instance-request-ids $sir | awk -F: '/Code/ { gsub(/[", ]/, "", $2); print $2}')
    sleep 30
  done

  i=$(aws ec2 describe-spot-instance-requests --spot-instance-request-ids $sir | awk -F: '/InstanceId/ { gsub(/[", ]/, "", $2); print $2}')
  aws ec2 modify-instance-attribute --instance-id $i --block-device-mappings  '[{"DeviceName":"/dev/sda1","Ebs":{"DeleteOnTermination":true}}]'

  echo $i
}

function poud_aws_get_priv_ip () {
  local i=$1

  local ip=$(aws ec2 describe-instances --instance-ids $i | awk -F: '/PrivateIpAddress/ && /10/ { gsub(/[", ]/, "", $2); print $2}' | head -1)

  echo $ip
}

function poud_aws_wait_for_ssh () {
  local ip=$1

  local avail=n
  while [ "$avail" != "y" ]; do
    ssh -o ConnectTimeOut=2 $ip  >/dev/null 2>&1
    case $? in
      0) avail=y ;;
      *) avail=n ;;
    esac
    sleep 1
  done
}

function poud_aws_terminate_instances () {
  local i=$1

  aws ec2 terminate-instances --instance-ids $i
}

function poud_aws_cancel_sport_instance_requests () {
  local sir=$1

  aws ec2 cancel-spot-instance-requests $sir
}

function poud_build_changed () {
  local build=$1

  mports=$(cd $PORTSDIR ; git status | grep : | awk -F: '/\// { print $2 }' | cut -d / -f 1,2 | sed -e 's, ,,g' | sort -u | xargs)
  nports=$(cd $PORTSDIR ; git status | grep "/$" | sed -e 's, ,,g' -e 's,/$,,' -e 's,^ *,,' -e 's, *$,,' | xargs)

  tports=$(_poud_transliterate_port "$mports $nports")

  tmux new -s $build "sudo poudriere bulk -t -B $tports-$(date "+%Y%m%d_%H%M") -j ${build} -C $nports $mports"
}

function poud_build_depends_on () {
  local build=$1
  local pkg=$2

  poud_pi deps $pkg > /tmp/$build-$pkg
  tmux new -s $build "sudo poudriere bulk -t -B $pkg-$(date "+%Y%m%d_%H%M") -j ${build} -C -f /tmp/$build-$pkg"
}

function poud_build_port () {
  local build=$1
  local port=$(_poud_from_dir_or_arg $2)
  local ip=$3

  tport=$(_poud_transliterate_port $port)
  cmd="sudo $_rdir/poudriere/src/bin/poudriere bulk -t -B ${tport}-$(date "+%Y%m%d_%H%M") -j ${build} -C $port"
  if [ -n $ip ]; then
    poud_wait_for_ssh $ip
    ssh $ip "$cmd"
  else
    eval $cmd
  fi
}

function poud_test_port () {
  local build=$1
  local port=$(_poud_from_dir_or_arg $2)

  sudo poudriere testport -j $build -o $port -I
  sudo jexec ${build}-default-n env -i TERM=$TERM /usr/bin/login -fp root
}

function poud_build_all () {
  local build=$1

  tmux new -s $build "sudo poudriere bulk -t -B all -j ${build} -a"
}

function poud_rbuild_port () {
  local build=$1
  local port=$(_poud_from_dir_or_arg $2)

  local sir=$(poud_aws_request_spot_instances "$build-$port")
  local i=$(poud_aws_spot_fulfilled $sir)
  local ip=$(poud_aws_get_priv_ip $i)

  poud_build_port $build $port $ip

  poud_aws_terminate_instance $i
  poud_aws_cancel_sport_instance_requests $sir
}

function poud_rbuild_all_build () {
  local build=$1

  local sir=$(poud_aws_request_spot_instances $build)
  local i=$(poud_aws_spot_fulfilled $sir)
  local ip=$(poud_aws_get_priv_ip $i)

  poud_wait_for_ssh $ip
  cmd="sudo $_rdir/poudriere/src/bin/poudriere bulk -t -B $(date "+%Y%m%d_%H%M") -j ${build} -a"
  ssh $ip "$cmd"

  poud_aws_terminate_instance $i
  poud_aws_cancel_sport_instance_requests $sir
}

function poud_rbuild_all () {

  for tag in ${=_build_tags}; do
    build=$(echo $tag | sed -e 's,-.*,,' -e 's,\.,,g')
    for arch in ${=_arches}; do
      poud_rbuild_all_build "$build$arch"
    done
  done
}

function poud_builds_nuke () {

  sudo find /usr/local/poudriere/data -type d -a \( -name "*i386*" -o -name "*amd64*"  -o -name latest-per-pkg \) | xargs sudo rm -rf
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
  local days=$(_bz_time_from_pr $pr)
  local update="$(cat $d/update)"

  local submitted_by=""
  local approved_by=""
  if [ $is_maintainer -eq 1 ]; then
    submitted_by="$reporter (maintainer)"
  else
    submitted_by="$reporter"
    if [ -n $days ]; then
      approved_by="maintainer timeout ($maintainer ; $days days)"
    else
      approved_by="$maintainer (maintainer)"
    fi
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
set -x
  local pr=$1

  local d=$(_bz_pr_dir $pr)
  local id=0

  local a_cnt=$(grep Attachments $d/info | cut -d: -f2 | sed -e 's, ,,g')
  if [ $a_cnt -gt 0 ]; then
    local id=$(grep "\[Attachment\]" $d/info | egrep -i 'shar|diff|patch' | awk '{ print $2 }' | sed -e 's,\[,,' -e 's,\],,' | sort -n | tail -1 )
    fetch -q -o $d/patch "https://bz-attachments.freebsd.org/attachment.cgi?id=$id"
    local s_cnt=$(head -1 $d/patch | grep -c "# This is a shell archive.")
    if [ $s_cnt -eq 1 ]; then
        echo "1" > $d/shar
    fi
  else
    echo "0" > $d/shar
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
  set -x
  local pr=$1

  local d=$(_bz_pr_dir $pr)

  local str="$(grep "Maintainer Timeout -" $d/info | awk -F'-' '{ print $2 }' | sed -e 's,^ *,,')"

  echo $str
}

function _bz_is_maintainer () {
  local reporter=$1
  local maintainer=$2

  if [ $reporter = $maintainer ]; then
    is_maintainer=1
  else
    is_maintainer=0
  fi

  echo $is_maintainer
}

function _bz_is_update () {
  local pr=$1

  local d=$(_bz_pr_dir $pr)
  local port=$(cat $d/port)

  p1=$(cd $PORTSDIR/$port ; git diff | grep PORTVERSION | head -1 | awk '{print $2}')
  p2=$(cd $PORTSDIR/$port ; git diff | grep PORTVERSION | tail -1 | awk '{print $2}')

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
  local l=$(grep ^Index: $d/patch | head -1 | awk '{ print gsub(/\//,"") }')

  ( cd $PORTSDIR/$port ; patch -p$l < $d/patch )
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
    mkdir -p $d/tmp
    (cd $d/tmp ; sh $d/patch)
    mv $d/tmp/* $PORTSDIR/$category
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

 $_bz --encoding=utf8 search -s New --product "Ports & Packages" | awk '{print $3}' | sort | uniq -c | sort -nr -k 1,1 | head $1
}

function bzlist () {
  local str="$1"

  $_bz --encoding=utf8 search --product "Ports & Packages" "$*"
}
