_rdir=/repos/freebsd
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
# for d in `cd $_rdir ; /bin/ls -1d *`; do
#   alias cd$d="cd $_rdir/$d"
# done

function _poud_msg () {
  local msg=$1

  local ts=$(date "+%Y/%m/%d_%H:%M:%S")

  echo -e >&2 "[$ts]: $msg"
}

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
    _poud_msg "need to be root"
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

  [ -z $z ] && _poud_msg "must specify a pool" && return

  local base
  case $z in
    $_zbackup) base=/b ;;
    $_zpool)   base=   ;;
    *)         _poud_msg "pool must be $_zbackup|$_zpool" && return ;;
  esac

  sudo zfs set mountpoint=none $z
  sudo zfs set atime=off $z
  sudo zfs set checksum=fletcher4 $z

  sudo zfs create -p -o mountpoint=$base/usr/local/etc/nginx $z/usr/local/etc/nginx
  sudo zfs create -p -o mountpoint=$base/repos $z/repos
  sudo zfs create -p -o mountpoint=$base/conf $z/conf
  sudo zfs create -p -o mountpoint=$base$_poudriere_dir $z$_poudriere_dir

  sudo touch /etc/exports
  sudo zfs sharenfs="-maproot=root -network 10.0.0.0 -mask 255.255.255.0" $z
}

function poud_repos_init () {

  sudo mkdir -p /repos/freebsd/{poudriere,pkg,pybugz} /repos/pgollucci
  sudo chown -R $USER:$USER /repos/{freebsd,pgollucci}

  (
    cd /repos/freebsd
    git clone git@github.com:freebsd/poudriere.git
    git clone git@github.com:freebsd/pkg.git
  )
  (
    cd /repos/pgollucci
    git clone git@github.com:pgollucci/pybugz.git
  )
  (
    cd /repos/freebsd/poudriere
    ./autogen
    ./configure
    make
  )
}

function poud_zfs_snapshot () {

  local containers="$(_poud_zfs_containers)"
    local dt=$(date "+%Y%m%d_%H%M")

  for container in ${=containers}; do
    sudo zfs snapshot $container@$dt
  done

  echo $dt
}

function _poud_zfs_containers () {

  echo "$(zfs list | grep $_zpool/ | awk '!/none/ { print $1 }')"
}

function poud_zfs_backup () {

  local dt=$(poud_zfs_snapshot)

  local containers="$(_poud_zfs_containers)"
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

  local git_repo=git@github.com:$USER/freebsd-ports.git
  local git_svn_uri=svn.freebsd.org/ports
  local svn_proto=svn+ssh

  local zdir=$_zpool/usr/local/poudriere/ports/clean
  local fsdir=${zdir##$_zpool}

  sudo zfs destroy -fr $zdir
  sudo zfs create -p $zdir
  sudo zfs set mountpoint=$fsdir $zdir

  sudo chown $USER:$USER $fsdir
  git clone $git_repo $fsdir

  (
    cd $fsdir
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
  )
}

function poud_ptree () {
  local tree=$1

  if [ -n "$tree" ]; then
    PORTSDIR=$_poudriere_ports/$tree && export PORTSDIR
    PDIR=$tree && export PDIR=$tree
  fi

  echo $PORTSDIR
}

function poud_b () {
  local build=$1

  if [ -n "$build" ]; then
    BUILD=$build && export BUILD
  fi

  echo $BUILD
}

function poud_ptree_make () {
  local tree=$1
  local from=${2:-clean}

  sudo zfs snapshot $_zpool$_poudriere_ports/$from@now
  sudo $_poudriere ports -c -F -p $tree
  sudo zfs clone    $_zpool$_poudriere_ports/$from@now $_zpool$_poudriere_ports/$tree
}

function poud_ptrees () {

  for tree in default perl apache ruby python mysql prs; do
    poud_ptree_make $tree
  done
}

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

function _poud_help () {
  local func=$1

  local me=$HOME/.zsh/plugins/fbsd/fbsd.plugin.zsh
  local s=$(grep -n "^##/ $func()" $me | awk -F: '{ print $1 }')
  local e=$(grep -n "^function $func ()" $me | awk -F: '{ print $1 }')
  local d=$(($e-$s))

  head -$e $me | tail -$d | sed -e 's,^##/ ,,'
}

##/ poud_build()
##/ usage:
##/    poud_build [-A ami_id] [-B bid] [-G sg-XXXXXXXX] \
##/               [-P ports_tree] [-b build] [-c|-d regex|-p port] [-k] \
##/               [-r regex] [-w where] [-z set]
##/    poud_build -t -p port [-b build] [-P ports_tree] [-z set]
##/    poud_build -h
##/ aws opts:
##/ ----------
##/   -A: ami_id
##/   -B: bid amount "XX.YY"
##/   -G: security Group
##/
##/ other opts
##/ -----------
##/   -P ports_tree
##/   -a: build all ports
##/   -b: what build to use
##/   -c: build any port(s) with changes in $PORTSDIR
##/   -r: build ports with port_name =~ /optarg/
##/   -d: build all that depends on regex/glob
##/   -h: help mesg
##/   -k: keep instance/request running when done
##/   -p: build port
##/   -t: testport instead of bulk
##/   -w: local|ondemand|spot
##/   -z: set
function poud_build () {
set -x
  ## defaults
  local aws_ami_id=ami-d15891ba
  local aws_spot_bid=2.00
  local aws_security_group_id=sg-76ff1811

  local f_a=0
  local build=$BUILD
  local f_c=0
  local depends_on=""
  local f_h=0
  local f_k=0
  local port=""
  local dir=""
  local f_t=0
  local where=spot
  local ports_tree=$PDIR
  local optset=default

  ## parse options
  while getopts A:B:G:P:S:T:ab:cd:hkp:r:tw:z: o; do
    case $o in
      A) aws_ami_id=$OPTARG            ;;
      B) aws_spot_bid=$OPTARG          ;;
      G) aws_security_group_id=$OPTARG ;;

      P) ports_tree=$OPTARG            ;;
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
      z) optset=$OPTARG                ;;
    esac
  done
  shift $(($OPTIND-1))

  if [ $f_h -eq 1 ]; then
    _poud_help "poud_build"
    return
  fi

  ## validate args
  [ $f_t -eq 1 ] && where=local

  ## what to build
  local ports_file="/tmp/fbsd-poudriere-$build-$(date "+%Y%m%d_%H%M")"
  _poud_build_what $f_a $f_c "$depends_on" "$dir" "$port" $ports_file "$build-$ports_tree"

  ## spin up
  local sir
  local iid
  local ip
  _poud_build_spin_up $aws_ami_id $aws_spot_bid $aws_security_group_id $where "$build-$ports_tree"

  ## do it
  _poud_build_exec $f_t $f_a $build "$port" $where $ports_file "$ip" $ports_tree $optset

  ## spin down
  _poud_build_spin_down $f_k $f_t $where "$sir" $iid "$build-$ports_tree"
}

function poud_build_all () {

  for tag in ${=_build_tags}; do
    local build=$(echo $tag | sed -e 's,-.*,,' -e 's,\.,,g')
    for arch in ${=_arches}; do
      poud_build -b $build$arch $* &
    done
  done
}

function _poud_build_spin_down () {
  local f_k=$1
  local f_t=$2
  local where=$3
  local sir=$4
  local iid=$5
  local build=$6

  if [ $f_k -eq 0 -a $f_t -eq 0 ]; then
    _poud_msg "$build: Spinning down....."
    case $where in
      spot) poud_aws_cancel_spot_instance_requests $sir ;;
    esac
    case $where in
      spot|ondemand) poud_aws_terminate_instances $iid ;;
    esac
  fi
}

function _poud_build_exec () {
  local f_t=$1
  local f_a=$2
  local build=$3
  local port=$4
  local where=$5
  local ports_file=$6
  local ip=$7
  local ports_tree=$8
  local optset=$9

  local dt=$(date "+%Y%m%d_%H%M")
  local B=$dt

  if [ $f_t -eq 1 ]; then
    sudo $_poudriere testport -j $build -o $port -p $ports_tree -i -s -z $optset
  else
    local what
    if [ $f_a -eq 1 ]; then
      what="-a"
    else
      what="-f $ports_file"
    fi

    local cmd2="sudo $_poudriere bulk -t -j $build -B $B -C $what -p $ports_tree -z $optset"
    case $where in
      local) eval "$cmd2" ;;
      spot|ondemand)
        local cmd1="sudo mkdir -p $_poudriere_ports/$ports_tree ; sudo mount -t nfs -o rw,intr,noatime,async fs:$_poudriere_ports/$ports_tree $_poudriere_ports/$ports_tree"
        if [ $f_a -eq 0 ]; then
          scp -q $ports_file $ip:$ports_file
        fi
        echo "ssh $ip $cmd1"
        echo "ssh $ip $cmd2"
        ssh $ip "$cmd1"
        ssh $ip "$cmd2"
    esac
  fi
}

##/ _poud_build_spin_up()
##/ side effects:
##/   sir
##/   iid
##/   ip
function _poud_build_spin_up () {
  local aws_ami_id=$1
  local aws_instance_type=$2
  local aws_security_group_id=$3
  local where=$4
  local buiild=$5

  case $where in
    spot)
      sir=$(poud_aws_request_spot_instances $aws_ami_id $aws_spot_bid $aws_security_group_id $build)
      iid=$(poud_aws_spot_fulfilled $sir $build)
      ip=$(poud_aws_get_priv_ip $iid $build)
      poud_aws_wait_for_ssh $ip $build
      ;;
    ondemand)
      iid=$(poud_aws_run_on_demand $aws_ami_id $aws_security_group_id $build)
      ip=$(poud_aws_get_priv_ip $iid $build)
      poud_aws_wait_for_ssh $ip $build
      ;;
  esac
}

function _poud_build_what () {
set -x
  local f_a=$1
  local f_c=$2
  local depends_on=$3
  local dir=$4
  local port=$5
  local ports_file=$6
  local build=$7

  _poud_msg "$build: What to build....."
  local ports
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
    _poud_help "poud_build"
    return
  fi
  if [ x"$ports" != x"" ]; then
    echo "$ports" > $ports_file
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
function poud_aws_run_on_demand () {
  local aws_ami_id=$1
  local aws_security_group_id=$2
  local build=$3

  _poud_msg "$build: Making OnDemand Request....."
  local iid=$(aws ec2 run-instances \
                --image-id $aws_ami_id \
                --count 1 \
                --instance-type "c3.4xlarge" \
                --security-group-ids $aws_security_group_id \
                --subnet-id "subnet-614f3b38" \
                --associate-public-ip-address | \
                 awk -F: '/InstanceId/ { gsub(/[", ]/, "", $2); print $2}'
        )

  sleep 3

  _poud_msg "$build: Tagging Instance"
  aws ec2 create-tags --resource $iid --tags "Key=Name,Value=ond.pbuilder.$build"

  _poud_msg "$build: Setting root EBS to delete on terminate....."
  local json="[{\"DeviceName\":\"/dev/sda1\",\"Ebs\":{\"DeleteOnTermination\":true}}]"
  aws ec2 modify-instance-attribute --instance-id $iid --block-device-mappings "$json" 2>/dev/null

  echo $iid
}

##/ _poud_aws_find_cheapest
##  side_effects:
##/   aws_cheapest_zone
##/   aws_cheapest_type
function _poud_aws_find_cheapest () {
  local build=$1

  _poud_msg  "$build: Looking for cheapest option....."

  local azs="1a 1b 1e 1c" # XXX: order matters based on where my nfs box is
  local types="r3.8xlarge c3.8xlarge c4.8xlarge m4.10xlarge i2.8xlarge d2.8xlarge" # XXX: order matters for code in case of ties

  local rolling_cheapest_price=""
  local rolling_cheapest_zone=""
  local rolling_cheapest_type=""

  for type in ${=types}; do
    local cheapest_zone=""
    local cheapest_price=""

    for az in ${=azs}; do
      local price=$(aws ec2 describe-spot-price-history \
                        --max-items 1 \
                        --availability-zone us-east-$az \
                        --instance-types $type | \
                         awk -F: '/SpotPrice"/ { print $2 }' | \
                         sed -e 's/[", ]//g'
            )
      # XXX: Floating point math
#      _poud_msg "$build: $type -> $az = $price"
      local rc=$(echo $price $cheapest_price | awk '{ printf "%d", ($1 <= $2) }')
      if [ $rc -eq 1 -o "$cheapest_price" = "" ]; then
         cheapest_zone=$az
         cheapest_price=$price
       fi
    done
#    _poud_msg "$build: Cheapest:($type) in $cheapest_zone @ \$$cheapest_price\n"

    local rc=$(echo $cheapest_price $rolling_cheapest_price | awk '{ printf "%d", ($1 <= $2) }')
    if [ $rc -eq 1 -o "$rolling_cheapest_price" = "" ]; then
      rolling_cheapest_zone=$cheapest_zone
      rolling_cheapest_price=$cheapest_price
      rolling_cheapest_type=$type
    fi
  done

  _poud_msg "$build: Found:($rolling_cheapest_type) in $rolling_cheapest_zone @ \$$rolling_cheapest_price\n"

  aws_cheapest_zone=$rolling_cheapest_zone
  aws_cheapest_type=$rolling_cheapest_type
}

function _poud_aws_zone_to_subnet () {
  local zone=$1

  case $zone in
    1a) subnet_id=subnet-875032ac ;;
    1b) subnet_id=subnet-5baf882c ;;
    1c) subnet_id=subnet-614f3b38 ;;
    1e) subnet_id=subnet-02dedc38 ;;
  esac

  echo $subnet_id
}

function poud_aws_request_spot_instances () {
  local aws_ami_id=$1
  local aws_spot_bid=$2
  local aws_security_group_id=$3
  local build=$4

  local aws_cheapest_zone
  local aws_cheapest_type
  _poud_aws_find_cheapest $build

  local aws_subnet_id=$(_poud_aws_zone_to_subnet $aws_cheapest_zone)

  _poud_msg "$build: Requesting Spot Instance....."
  local json="{\"ImageId\":\"$aws_ami_id\",\"InstanceType\":\"$aws_cheapest_type\",\"NetworkInterfaces\":[{\"Groups\":[\"$aws_security_group_id\"],\"DeviceIndex\":0,\"SubnetId\":\"$aws_subnet_id\",\"AssociatePublicIpAddress\":true}]}"
  local sir=$(aws ec2 request-spot-instances \
                  --spot-price "$aws_spot_bid" \
                  --instance-count 1 \
                  --type "one-time" \
                  --launch-specification "$json" | \
                   awk -F: '/SpotInstanceRequestId/ { gsub(/[", ]/, "", $2); print $2}'
        )

  _poud_msg "$build: Tagging Spot Request"
  aws ec2 create-tags --resources $sir --tags "Key=Name,Value=sir.pbuilder.$build"

  echo $sir
}

function poud_aws_spot_fulfilled () {
  local sir=$1
  local build=$2

  _poud_msg "$build: Waiting for fulfillment....."

  local prev_code=
  local code=
  while [ x"$code" != x"fulfilled" ]; do
    local code=$(aws ec2 describe-spot-instance-requests --spot-instance-request-ids $sir | awk -F: '/Code/ { gsub(/[", ]/, "", $2); print $2}')
    if [ x"$prev_code" != x"$code" ]; then
      prev_code=$code
      _poud_msg "$build: -> $code"
    fi
    sleep 5
  done

  local iid=$(aws ec2 describe-spot-instance-requests --spot-instance-request-ids $sir | awk -F: '/InstanceId/ { gsub(/[", ]/, "", $2); print $2}')
  local json="[{\"DeviceName\":\"/dev/sda1\",\"Ebs\":{\"DeleteOnTermination\":true}}]"
  aws ec2 modify-instance-attribute --instance-id $iid --block-device-mappings "$json"

  _poud_msg "$build: Tagging Spot Instance"
  aws ec2 create-tags --resources $iid --tags "Key=Name,Value=sir.pbuilder.$build"

  echo $iid
}

function poud_aws_get_priv_ip () {
  local iid=$1
  local build=$2

  local ip=$(aws ec2 describe-instances --instance-ids $iid | awk -F: '/PrivateIpAddress/ && /10/ { gsub(/[", ]/, "", $2); print $2}' | head -1)
  _poud_msg "$build: Instance has private ip: $ip"

  echo $ip
}

function poud_aws_wait_for_ssh () {
  local ip=$1
  local build=$2

  _poud_msg "$build: Waiting for ssh....."
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
