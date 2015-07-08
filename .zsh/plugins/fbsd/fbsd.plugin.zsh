_rdir=$HOME/repos/fbsd
if [ -d $_rdir ]; then
  _poudriere_dir=/usr/local/poudriere
  _poudriere_data=$_poudriere_dir/data
  _poudriere_ports=$_poudriere_dir/ports
  _poudriere=$_rdir/poudriere/src/bin/poudriere

  _zpool=zfs
  _zbackup=zfsbackup
  _snap_keep_cnt=1

  _arches="i386 amd64"
  _build_tags="8.4-RELEASE 9.3-RELEASE 10.1-RELEASE 11.0-CURRENT"

  alias cdpdir='cd $PORTSDIR'
  for d in `cd $_rdir ; /bin/ls -1d *`; do
    alias cd$d="cd $_rdir/$d"
  done
else
  return
fi

function _poud_checksum_port_str () {
  local str=$1

  echo $str | md5
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
  env ASSUME_ALWAYS_YES=YES pkg bootstrap
  pkg install -y \
      automake awscli bash-static dialog4ports emacs-nox11 git-subversion \
      hub libtool nginx php5-arcanist portlint python34 ruby21-gems rsync \
      sudo swaks tmux vim-lite zsh
}

function poud_zfs_init () {
  local z=$1

  [ -z $z ] && echo "must specify a pool" && return

  local base
  case $z in
    $_zbackup) base=/b ;;
    $_zpool)   base=   ;;
    *)         echo "pool must be $_zbackup|$_zpool" && return ;;
  esac

  sudo zfs set mountpoint=none $z
  sudo zfs set atime=off $z
  sudo zfs set sync=disabled $z
  sudo zfs set checksum=fletcher4 $z

  sudo zfs create -p -o mountpoint=$base/usr/local/etc/nginx $z/usr/local/etc/nginx
  sudo zfs create -p -o mountpoint=$base/usr/home/$USER/repos $z/usr/home/$USER/repos
  sudo zfs create -p -o mountpoint=$base/usr/local/poudriere $z/usr/local/poudriere

  sudo touch /etc/exports
  sudo zfs sharenfs="-maproot=root -network 10.0.0.0 -mask 255.255.255.0" $z
}

function poud_zfs_snapshot () {

  local containers="$(zfs list | grep $_zpool/ | awk '!/none/ { print $1 }')"
  local dt=$(date "+%Y%m%d_%H%M")

  for container in ${=containers}; do
    sudo zfs snapshot $container@$dt
  done

  echo $dt
}

function poud_zfs_backup () {

  local dt=$(poud_zfs_snapshot)

  local containers="$(zfs list | grep $_zpool/ | awk '!/none/ { print $1 }')"
  for container in ${=containers}; do
    local prev_dt=$(zfs list -t snapshot | grep $container | awk '{ print $1 }' | awk -F@ '{ print $2 }' | tail -2 | head -1)
    local backup=$(echo $container | sed -e "s,$_zpool,$_zbackup,")
    sudo zfs send -pi $container@$prev_dt $container@$dt | sudo zfs receive $backup
  done

  poud_zfs_backup_prune
}

function poud_zfs_backup_prune () {

  local pools="$(zfs list -t snapshot | grep $_zpool | awk -F@ '{ print $1 }' | sort -u)"
  for pool in ${=pools}; do
    local snap_cnt=$(zfs list -t snapshot | grep $pool | wc -l |sed -e 's, ,,g')
    if [ $snap_cnt -gt $_snap_keep_cnt ]; then
      local snaps="$(zfs list -t snapshot | grep $pool | head -$(($snap_cnt-1)) | awk '{ print $1 }')"
      for snap in ${=snaps}; do
        sudo zfs destroy $snap
      done
    fi
  done
}

function poud_jails_delete () {

  for tag in ${=_build_tags}; do
    local build=$(echo $tag | sed -e 's,-.*,,' -e 's,\.,,g')
    for arch in ${=_arches}; do
      sudo $_poudriere jail -d -j $build$arch
    done
  done
}

function poud_jails_create () {

  for tag in ${=_build_tags}; do
    local build=$(echo $tag | sed -e 's,-.*,,' -e 's,\.,,g')
    for arch in ${=_arches}; do
      sudo $_poudriere jail -c -j $build$arch -v $tag -a $arch
    done
  done
}

function poud_jails_update () {

  for tag in ${=_build_tags}; do
    local build=$(echo $tag | sed -e 's,-.*,,' -e 's,\.,,g')
    for arch in ${=_arches}; do
      sudo $_poudriere jail -u -j $build$arch
    done
  done

  # XXX: can't update -CURRENT, -d,-c
}

function poud_ptree_init () {

  if [ -z $PORTSDIR -o -z $_pdir ]; then
      echo "must call `pdir foo` 1st"
      return
  fi

  local git_repo=git@github.com:$USER/freebsd-ports.git
  local git_svn_uri=svn.freebsd.org/ports
  local svn_proto=svn+ssh

  local zdir=$_zpool/usr/local/poudriere/ports/$_pdir

  sudo zfs destroy -fr $zdir
  sudo zfs create $zdir
  sudo zfs set mountpoint=$PORTSDIR $zdir

  sudo chown $USER:$USER $PORTSDIR
  git clone $git_repo $PORTSDIR

  cd $PORTSDIR
  git svn init -T head $svn_proto://$git_svn_uri .

  git config oh-my-zsh hide-dirty 1
  git config --add remote.origin.fetch '+refs/pull/*:refs/remotes/origin/pull/*'

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

  local _pdir

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
  local modifier=$2

  local out
  case $modifier in
    M) out=$(echo $dir | sed -e 's,/usr/ports/,,' -e 's,$,/Makefile,') ;;
    P) out=$(echo $dir | sed -e 's,/usr/ports/,,' -e 's,$,/pkg-plist,') ;;
    D) out=$(echo $dir | sed -e 's,/usr/ports/,,' -e 's,$,/pkg-descr,') ;;
    *) out=$(echo $dir | sed -e 's,/usr/ports/,,') ;;
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

  local regex=$(echo $regex | sed -e 's,/,\\/,g')

  local index_file=$PORTSDIR/INDEX-11

  local out
  if [ $field = "deps" ]; then
    out=$(awk -F'|' "\$8 ~ /$regex/ || \$9 ~ /$regex/ || \$11 ~ /$regex/ || \$12 ~ /$regex/ || \$13 ~ /$regex/ { print \$2 }" $index_file)
  else
    out=$(awk -F'|' "\$$pos ~ /$regex/ { print \$2 }" $index_file)
  fi

  if [ x"$out" != x"" ]; then
    _poud_append_file $out $modifier
  fi
}

function poud_pkg_to_port {
  local pkg=$1
  local modifier=$2

  local out=$(awk -F\| "\$1 ~ /$pkg/ { print \$2 }" $PORTSDIR/INDEX-11 | sed -e "s,/usr/ports/,,")

  if [ x"$out" != x"" ]; then
    _poud_append_file $out $modifier
  fi
}

function poud_go () {
  local port=$1

  local dir=$(poud_pi dir $port | head -1)
  cd $PORTSDIR/$dir
}

function poud_uses () {
  local str=$1
  local pattern=${2:-USE}

  (cd $PORTSDIR ; poud_pi deps $str M | xargs grep $pattern)
}

function poud_help () {
  local func=$1

  local me=$HOME/.zsh/plugins/fbsd/fbsd.plugin.zsh
  local s=$(grep -n "^##/ $func()" $me | awk -F: '{ print $1 }')
  local e=$(grep -n "^function $func ()" $me | awk -F: '{ print $1 }')
  local d=$(($e-$s))

  head -$e $me | tail -$d | sed -e 's,^##/ ,,'
}

##/ poud_build()
##/ usage:
##/    poud_build [-A ami_id] [-B bid] [-G sg-XXXXXXXX] [-S subnet-XXXXXXXX] [-T type] \
##/               [-b build] [-c|-d regex|-p port] [-k] [-r regex] [-w where]
##/    poud_build -t -p port [-b build]
##/    poud_build -h
##/ aws opts:
##/ ----------
##/   -A: ami_id
##/   -B: bid amount "XX.YY"
##/   -G: security Group
##/   -S: subnet_id
##/   -T: instance_type|cheapest 32cpu+
##/
##/ other opts
##/ -----------
##/   -a: build all ports
##/   -b: what build to use
##/   -c: build any port(s) with changes in $PORTSDIR
##/   -r: build ports with port_name =~ /optarg/
##/   -d: build all that depends on regex/glob
##/   -h: help mesg
##/   -k: keep instance/request running when done
##/   -p: build port
##/   -t: testport instead of bulk
##/   -w: locally, or spin up a spot or on-demand aws instance
function poud_build () {

  ## defaults
  echo "Setting Defaults....."
  local aws_ami_id=ami-7930fe12
  local aws_spot_bid=2.00
  local aws_security_group_id=sg-76ff1811
  local aws_subnet_id=subnet-614f3b38
  local aws_instance_type=c4.8xlarge

  local f_a=0
  local build=110amd64
  local f_c=0
  local depends_on=""
  local f_h=0
  local f_k=0
  local port=""
  local dir=""
  local f_t=0
  local where=spot

  ## parse options
  echo "Parsing Options....."
  while getopts A:B:G:S:T:ab:cd:hkp:r:tw: o; do
    case $o in
      A) aws_ami_id=$OPTARG            ;;
      B) aws_spot_bid=$OPTARG          ;;
      G) aws_security_group_id=$OPTARG ;;
      S) aws_subnet_id=$OPTARG         ;;
      T) aws_instance_type=$OPTARG     ;;

      a) f_a=1                         ;;
      b) build=$OPTARG                 ;;
      c) f_c=1                         ;;
      d) depends_on=$OPTARG            ;;
      h) f_h=1                         ;;
      k) f_k=1                         ;;
      p) port=$OPTARG                  ;;
      r) dir=$OPTARG                   ;;
      t) f_t=1                         ;;
      w) where=$OPTARG                 ;;
    esac
  done
  shift $(($OPTIND-1))

  if [ $f_h -eq 1 ]; then
    poud_help "poud_build"
    return
  fi

  ## validate args
  if [ $f_t -eq 1 ]; then
    where=local
  fi

  ## what to build
  echo "What to Build....."
  local ports
  local ports_file=/tmp/$build.$$
  if [ $f_a -eq 1 ]; then
    ports=""
  elif [ $f_c -eq 1 ]; then
    ports="$(poud_new_or_modified_ports)"
  elif [ x"$depends_on" != x"" ]; then
    ports="$(poud_pi deps $depends_on)"
  elif [ x"$dir" != x"" ]; then
    ports="$(poud_pi dir $dir)"
  elif [ x"$port" != x"" ]; then
    ports=$port
  else
    echo "Failed."
    poud_help "poud_build"
    return
  fi
  if [ x"$ports" != x"" ]; then
    echo "$ports" > $ports_file
  fi

  ## spin up
  echo "Spinning Up....."
  local sir
  local iid
  local ip
  case $where in
    spot)
      echo "Waiting for fulfillment....."
      sir=$(poud_aws_request_spot_instances $aws_ami_id $aws_spot_bid $aws_instance_type $aws_security_group_id $aws_subnet_id $build $port)
      iid=$(poud_aws_spot_fulfilled $sir)
      ip=$(poud_aws_get_priv_ip $iid)
      echo "Waiting for ssh....."
      poud_aws_wait_for_ssh $ip
      ;;
    ondemand)
      echo "Waiting for instance....."
      iid=$(poud_aws_run_on_demand $aws_ami_id $aws_instance_type $aws_security_group_id $aws_subnet_id $build $port)
      ip=$(poud_aws_get_priv_ip $iid)
      echo "Waiting for ssh....."
      poud_aws_wait_for_ssh $ip
      ;;
  esac

  ## do it
  echo "Building....."
  local dt=$(date "+%Y%m%d_%H%M")
  local tports="$(_poud_checksum_port_str \"$(echo $ports |xargs)\")"
  local B
  if [ x"$tports" = x"" ]; then
      B="all-$dt"
  else
      B="${tports}-${dt}"
  fi
  local what
  local cmd

  if [ $f_t -eq 1 ]; then
      sudo $_poudriere testport -j $build -o $port -i -s
      sudo jexec ${build}-default-n env -i TERM=$TERM /usr/bin/login -fp root
  else
    if [ $f_a -eq 1 ]; then
      what="-a"
    else
      what="-f $ports_file"
    fi
    cmd="sudo $_poudriere bulk -t -j $build -B $B -C $what"
    scp -q $ports_file $ip:$ports_file
    echo "ssh $ip $cmd"
    ssh $ip "$cmd"
  fi

  ## spin down
  if [ $f_k -eq 0 ]; then
    echo "Spinning down....."
    case $where in
      spot) poud_aws_cancel_spot_instance_requests $sir ;;
    esac
    case $where in
      spot|ondemand) poud_aws_terminate_instances $iid ;;
    esac
  fi
}

function poud_new_or_modified_ports () {

  local mports="$(cd $PORTSDIR ; git status | grep : | awk -F: '/\// { print $2 }' | cut -d / -f 1,2 | sed -e 's, ,,g' | sort -u | grep -v Mk/)"
  local nports="$(cd $PORTSDIR ; git status | grep "/$" | sed -e 's, ,,g' -e 's,/$,,' -e 's,^ *,,' -e 's, *$,,' | grep -v Mk/)"

  echo "$mports $nports"
}

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
function poud_aws_run_on_demand () {
  local aws_ami_id=$1
  local aws_instance_type=$2
  local aws_security_group_id=$3
  local aws_subnet_id=$4
  local build=$5

  local i=$(aws ec2 run-instances \
                --image-id $aws_ami_id \
                --count 1 \
                --instance-type $aws_instance_type \
                --security-group-ids $aws_security_group_id \
                --subnet-id $aws_subnet_id \
                --associate-public-ip-address | \
                 awk -F: '/InstanceId/ { gsub(/[", ]/, "", $2); print $2}'
        )

  sleep 3
  local json="[{\"DeviceName\":\"/dev/sda1\",\"Ebs\":{\"DeleteOnTermination\":true}}]"
  aws ec2 modify-instance-attribute --instance-id $i --block-device-mappings "$json" 2>/dev/null

  echo $i
}

function poud_aws_request_spot_instances () {
  local aws_ami_id=$1
  local aws_spot_bid=$2
  local aws_instance_type=$3
  local aws_security_group_id=$4
  local aws_subnet_id=$5
  local build=$6

  if [ $aws_instance_type = "cheapest" ]; then
    echo >&2 "Looking for Cheapest option....."
    local ctype
    local cprice=100
    local czone
    for zone in 1a 1b 1c 1e; do
      for type in r3.8xlarge c3.8xlarge c4.8xlarge m4.10xlarge i2.8xlarge d2.8xlarge; do
        local p=$(aws ec2 describe-spot-price-history \
                      --max-items 1 \
                      --availability-zone us-east-$zone \
                      --instance-types $type | \
                       awk -F: '/SpotPrice"/ { print $2 }' | \
                       sed -e 's/[", ]//g'
              )
        # XXX: Floating point math
        rc=$(echo $p $cprice | awk '{ printf "%d", ($1 < $2) }')
        if [ $rc -eq 1 ]; then
            czone=$zone
            cprice=$p
            aws_instance_type=$type
        fi
      done
    done

    case $czone in
      1a) aws_subnet_id=subnet-875032ac ;;
      1b) aws_subnet_id=subnet-5baf882c ;;
      1c) aws_subnet_id=subnet-614f3b38 ;;
      1e) aws_subnet_id=subnet-02dedc38 ;;
    esac

    echo >&2 "Found $aws_instance_type @ \$$cprice in $czone"
  fi

  local json="{\"ImageId\":\"$aws_ami_id\",\"InstanceType\":\"$aws_instance_type\",\"NetworkInterfaces\":[{\"Groups\":[\"$aws_security_group_id\"],\"DeviceIndex\":0,\"SubnetId\":\"$aws_subnet_id\",\"AssociatePublicIpAddress\":true}]}"

  local sir=$(aws ec2 request-spot-instances \
                  --spot-price "$aws_spot_bid" \
                  --instance-count 1 \
                  --type "one-time" \
                  --launch-specification "$json" | \
                   awk -F: '/SpotInstanceRequestId/ { gsub(/[", ]/, "", $2); print $2}'
        )

  echo $sir
}

function poud_aws_spot_fulfilled () {
  local sir=$1

  local code=$(aws ec2 describe-spot-instance-requests --spot-instance-request-ids $sir | awk -F: '/Code/ { gsub(/[", ]/, "", $2); print $2}')
  while [ $code != "fulfilled" ]; do
    code=$(aws ec2 describe-spot-instance-requests --spot-instance-request-ids $sir | awk -F: '/Code/ { gsub(/[", ]/, "", $2); print $2}')
    sleep 5
  done

  local iid=$(aws ec2 describe-spot-instance-requests --spot-instance-request-ids $sir | awk -F: '/InstanceId/ { gsub(/[", ]/, "", $2); print $2}')
  local json="[{\"DeviceName\":\"/dev/sda1\",\"Ebs\":{\"DeleteOnTermination\":true}}]"
  aws ec2 modify-instance-attribute --instance-id $iid --block-device-mappings "$json"

  echo $iid
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
    ssh -o ConnectTimeOut=2 $ip 'echo' >/dev/null 2>&1
    case $? in
      0) avail=y ;;
      *) avail=n ;;
    esac
    sleep 5
  done
}

function poud_aws_terminate_instances () {
  local iid=$1

  aws ec2 terminate-instances --instance-ids $iid
}

function poud_aws_cancel_spot_instance_requests () {
  local sir=$1

  aws ec2 cancel-spot-instance-requests --spot-instance-request-ids $sir
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
    local id=$(grep "\[Attachment\]" $d/info | egrep -i 'shar|diff|patch' | awk '{ print $2 }' | sed -e 's,\[,,' -e 's,\],,' | sort -n | tail -1 )
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
  local l=$(egrep "^Index:|^diff " $d/patch | head -1 | awk '{ print gsub(/\//,"") }')
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

  $_bz --encoding=utf8 search --product "Ports & Packages" -s New -s Open -s Inprogress "$*"
}
