##############################################################################
#
# Given a str of k=v pairs seperated by split generate sed -e sSMaMSbSg lines
# where S is sep and M is mark. Join results by + which I've haven't had to
# use in a substition pattern yet.
#
# i.e. s,%%a%%,b,g
#
# Args:
#  mark  - surrounding token identifier "" is valid too
#  sep   - delimiter for sed substitutions
#  split - k=v pairs are seperated by this
#  args  - k=v list
#
# Output:
#  sed_res
#
##############################################################################
token_args_from_list() {
  local mark="$1"
  local sep="$2"
  local split="$3"
  shift 3
  local list="$@"

  local pair
  local args
  local SAVE_IFS=$IFS
  IFS=$split
  for pair in $list; do
      local k=$(echo $pair |cut -f 1 -d '=')
      local v=$(echo $pair |cut -f 2- -d '=')
      args="${args}s${sep}${mark}${k}${mark}${sep}${v}${sep}g#"
  done
  IFS=$SAVE_IFS
  echo $args |sed -e 's,\#$,,'
}

##############################################################################
#
# Meant to be used in a loop to wait 2x as long before trying something again
# You don't want to hit an API as fast as possible if your doing something like
# waiting for Windows to boot which takes ~11min with our AMIs.
#
# Args:
#  i - how long to wait
#
# Output
#  2*i (aka double)
#
##############################################################################
doubling_backoff_retry() {
  local i="${1:-1}"

  sleep ${i}

  echo $(($i*2))
}

##############################################################################
#
# Generates a pseudo-random INSECURE password of length len
#
# Args:
#  len - length of password to generate
#
# Output:
#  the password
#
##############################################################################
make_password() {
  local len="$1"

  local pw=$(cat /dev/urandom | env LC_CTYPE=C tr -dc a-zA-Z0-9 | head -c ${len})
  echo $pw
}

##############################################################################
#
# Returns unqualified direct childern of a directory that you have  r,x permissions to
# If it exists.  If not ""
#
# Args:
#  dirs - 1+ full paths to dirs
#
# Output:
#  the children list
#
##############################################################################
list_dirs() {

    local dir
    for dir in "$@"; do
	if [ -d $dir ]; then
	    (cd $dir ; ls -1)
	fi
    done
}

##############################################################################
#
# Determines if something (script) should be run based on a list of things
# to skip (skip_list).  If script is in skip_list return 0 else 1
#
# You can interpret the 0/1 either way you like though I recommend being consistent
# and 1 means yes, 0 no.
#
# This works in all shells (ba)sh,(t)csh,zsh and its implimentation is intentional.
#
# Args:
#   script    - file name (will strip .sh extension if present)
#   skip_list - list of file names without .sh extension to skip
#
# Output:
#  0|1
#
# Note, It does not run the thing only checks if you should
##############################################################################
should_run() {
    local script="${1%.sh}"
    local skip_list="$2"

    local item
    for item in $(echo $skip_list); do
	if [ "$item" = "$script" ]; then
	    echo 0
	    return
	fi
    done

    echo 1
}

##############################################################################
#
# KeyName is option.  If this context should make a keypair then return its
# name.
#
# Args:
#   cmd       - file name (will strip .sh extension if present)
#   skip_list - list of file names without .sh extension to skip
#   key_name  - name of key
#
# Output:
#   "" or key_name
#
##############################################################################
key_name_get() {
  local cmd="$1"
  local skip_list="$2"
  local key_name="$3"

  local needs_ec2_keypair=$(should_run "${cmd}" "${skip_list}")
  local ec2_key_name
  case ${needs_ec2_keypair} in
      0) ec2_key_name= ;;
      1) ec2_key_name=${key_name} ;;
  esac

  echo $ec2_key_name
}

##############################################################################
#
# If key_name is None or DNE Output msg and die with code 32
#
# If nofatal is nofatal then echo/return instead of die
#
# Args:
#  key_name - name of key
#  msg      - msg to output
#
# Output
#  msg || none
#
# EXITS
#
##############################################################################
key_check() {
    local key_name="$1"
    local msg="$2"
    local nofatal="$3"

    local flag=pass
    if [ x"$key_name" = x"None" ]; then
	flag=fail
    elif [ ! -r ${key_name} ]; then
	flag=fail
    fi

    case ${flag} in
	fail)
	    if [ x"$nofatal" = x"nofatal" ]; then
		msg "${msg}"
		return 32
	    else
		die "32" "${msg}"
	    fi
	    ;;
    esac
}

##############################################################################
#
# Runs a script if found in list with shell.  Set shell flags set_flags
# and invokes shell with cmd_env as ENV.  PATH should be part of cmd_env.
#
# First match wins in list
#
# Args:
#  cmd_env   - string of k=v pairs space separated
#  shell     - which shell (i.e. sh|ksh|(ba)sh|(t)csh|zsh
#              code which gets run must work in this shell
#  set_flags - space seperated list of shell set flags (i.e. -e -x)
#  cmd       - file_name to run
#  exts      - space seperated string of file extensions. [default: .sh]
#  arg_list  - args to pass to cmd (including options) or ""
#  list      - 1+ dirs to look for cmd in
#
# Return
#  exit code of cmd || nothing if not found
#
##############################################################################
run_script() {
    local cmd_env="$1"
    local shell="$2"
    local set_flags="$3"
    local cmd="$4"
    local exts="${5:-.sh}"
    local arg_list="$6"
    shift 6

    local file=$(file_cascade "${cmd}" "${exts}" $@)
    debug "Run: [$file]"
    env -i ${cmd_env} ${shell} ${set_flags} ${file} $arg_list
}

##############################################################################
#
# Finds file with any extension in exts in remaining dir args
# First match wins in list
#
# Args:
#  file      - file_name to find
#  exts      - space seperated string of file extensions or blank
#  list      - 1+ dirs to look for cmd in
#
# Return
#  full path of file if found || nothing if not
#
##############################################################################
file_cascade() {
    local cmd="$1"
    local exts="$2"
    shift 2

    # Search
    local path
    for path in "$@"; do
	if [ -z "${exts}" ]; then
	    debug "Looking: [$path/$cmd]"
	    if [ -f "$path/$cmd" ]; then
		debug "Found: $path/$cmd"
		echo "$path/$cmd"
		break 2
	    fi
	else
	    local ext
	    for ext in $exts ''; do
		debug "Looking: [$path/$cmd$ext]"
		if [ -f "$path/$cmd$ext" ]; then
		    debug "Found: $path/$cmd$ext"
		    echo "$path/$cmd$ext"
		    break 2
		fi
	    done
	fi
    done
}

##############################################################################
#
# Source file if exists and readable (chmod +r)
#
# Args:
#  file - full path to file
#
# SIDE EFFECTS: whatever file does
#
##############################################################################
load_file() {
    local file="$1"

    debug "Loading $file"
    [ -r $file ] && . $file
}

##############################################################################
#
# Adds appends dir to path if dir exists and returns path
# Final result should be used in export PATH=$PATH or similiar.
#
# Args:
#   dir      - /path
#   path     - current PATH
#
# Output
#   new path
#
# Doesn't modify the live PATH in anyway
#
##############################################################################
path_if() {
    local dir="$1"
    local path="$2"

    local SAVE_IFS=$IFS
    IFS=' '
    if [ -d $dir ]; then
	if [ -n "${path}" ]; then
	    path="${path}:$dir"
	else
	    path="$dir"
	fi
    fi
    echo $path
    IFS=$SAVE_IFS
}

##############################################################################
#
# Stops Dead if env is prod
#
# Args:
#  env - dev|qa|prod
#
##############################################################################
prod_gaurd() {
    local env="$1"

    if [ x"${env}" = x"prod" ]; then
	if [ -n "${TEST_MODE}" ]; then
	    echo "ARE YOU NUTS?"
	    return 255
	else
	    die "255" "ARE YOU NUTS?"
	fi
    fi
}

##############################################################################
#
# Creates an enc key in key_file of key_size using openssl base64
#
# Args:
#  key_size - 2048|4096|8192
#  key_file - full /path to save key in
#
# SIDE EFFECTS: key_file is created
#
##############################################################################
key_generate() {
  local key_size="$1"
  local key_file="$2"

  if [ ! -r ${key_file} ]; then
      openssl rand -base64 ${key_size} > ${key_file}
  fi
}

##############################################################################
#
# Prompt user for Y or n.  Continue until interrupted or Y or n.
# If n exit else continue
#
# Output:
#  Prompt msgs
#
##############################################################################
confirm() {

    while [ : ]; do
	msg "Are you sure Y/n?: \c"
	local answer
	read answer

	[ x"${answer}" = x"Y" -o x"${answer}" = x"n" ] && break
    done

    if [ x"${answer}" = x"n" ]; then
	if [ -n "${TEST_MODE}" ]; then
	    echo "Asked to Exit"
	    return 42
	else
	    die "42" "Asked to Exit."
	fi
    fi
}

##############################################################################
#
# If DRY_RUN (global) is set in ENV then log and format cmd
# else run it!
# let cmd=args
#
#
# Args:
#  args - 1+ args
#
# Output:
#  whatever cmd outputs
#
# XXX: uses perl
#
##############################################################################
cond_run() {
    local cmd="$*"

    if [ -n "${DRY_RUN}" ]; then
	log "$cmd" | perl -p -e "s, , \\\\\n\t,g"
    else
	eval $cmd
    fi
}

##############################################################################
#
# Will conditionally append add_str to str seperated by sep (defaults to ,)
# if the flag is not 0.
#
# Args:
#  str       - original string
#  flag      - 0|anything
#  add_str   - what to append
#  sep       - seperatation token i.e. ,
#
# Output:
#   string with appended info
#
##############################################################################
cond_add_str() {
    local str="$1"
    local flag="$2"
    local add_str="$3"
    local sep="${4:-,}"

    if [ x"$flag" != x"0" ]; then
	str="$str${sep}$add_str"
    fi

    echo $str
}

##############################################################################
#
# Will conditionally append add_str to str seperated by sep (defaults to ,)
# if the env is not contained not_env.
#
# Args:
#  str       - original string
#  thing     - thing i.e. env being run in dev|qa|prod|dr
#  not_thing - any subset of the above
#  add_str   - what to append
#  sep       - seperatation token i.e. ,
#
# Output:
#   string with appended info
#
##############################################################################
cond_subset_add_str() {
    local str="$1"
    local thing="$2"
    local not_thing="$3"
    local add_str="$4"
    local sep="${5:-,}"

    case $thing in
	$not_thing) ;;
	*)
	    str="$str${sep}$add_str"
	    ;;
    esac

    echo $str
}

##############################################################################
#
# Wait until ssh is responding.  This may hang if ssh never comes up
#
# Args:
#  ip - ip address
#
# Output:
#  none
#
##############################################################################
wait_for_ssh() {
  local ip="$1"

  local avail=n
  while [ "$avail" != "y" ]; do
    ssh -N -o ConnectTimeOut=2 -o BatchMode=yes $ip 'echo' >/dev/null 2>&1
    echo .
    case $? in
      0) avail=y ;;
      *) avail=n ;;
    esac
    sleep 5
  done
}

##############################################################################
#
#
##############################################################################
value_for_key_from_list() {
    local key="$1"
    local list="$2"

    if ! echo $list | grep -q :; then
	echo $list
    else
	echo $list | grep -Eo "$key:.[a-zA-Z0-9_\-\.]+" | sed -e 's, .*,,g' -e 's,.*:,,'
    fi
}

##############################################################################
#
# Obligatory STDOUT/STDERR et al wrappers.
#
#############################################################################
msg() {
    echo "$@"
}

verbose() {
    local level="$1"
    shift

    VERBOSE=${VERBOSE:-0}
    [ $VERBOSE -ne 0 -a \( $level -gt $VERBOSE -o $level -eq $VERBOSE \) ] && echo "$@"
}

log() {
    echo "$@"
}
elog() {
    echo >&2 "$@"
}

error() {
    echo >2 "$@"
}

die() {
    local code="$1"
    shift

    echo "$@"
    exit $code
}

debug() {
    [ -n "$DEBUG" ] || return

    echo >&2 "$@"
}

header() {
    local indent="$1"
    shift

    local i=0
    while [ $i -lt $indent ]; do
	echo "=\c"
	i=$(($i+1))
    done

    echo "> \c"
    echo "$@"
}
##############################################################################
#
# Processes src to dst filling in %%placeholders%%
# complex is for multiline inserts or hard to escape/quote,
# otherwise use pairs.  Both may be used simultaneously.  If both
# provide values for the same %%token%% then pairs wins.
#
# Args:
#   src     - full path to src file
#   dst     - full path to dst file
#   pairs   - comma sep list of n=v pairs
#   complex - token:file
#
# Output:
#   none
#
# SIDE EFFECTS:
#   dst file exists, caller MUST cleanup
#
##############################################################################
aws_cft_preprocess() {
      local src="$1"
      local dst="$2"
      local pairs="$3"
      local complex="$4"

      local fixes="\"{={%\" {={%}\"=}"
      local token_args
      if [ -n "$pairs" ]; then
	  token_args=$(token_args_from_list "" "@" "%" "${pairs}%${fixes}")
      fi

      if [ -n "$complex" ]; then
	  local token=$(echo ${complex} | cut -d = -f 1)
	  local file=$(echo ${complex} | cut -d = -f 2)

	  token_args="${token_args}#/${token}/r ${file}"
	  token_args="${token_args}#/${token}/d"
      fi

      template_fill_in "${src}" "${dst}" "quoted" "${token_args}"
      verbose "1" "$(cat ${dst})"
}

##############################################################################
#
# Runs scripts in dirs with shell matching regex which are
# not in skip_list. Search dirs in order.
#
# Args:
#   cmd_env   - [VAR1=VAL1 VAR2=VAL2...]
#   shell     - which shell to run under
#   regex     - grep pattern to limit to
#   skip_list - srring to skip space separated
#   exts      - list of extensions to search for
#   dirs      - 1+ ordered dirs to look in
#
# Outputs
#   Status Mgs + scripts output
#
##############################################################################
stacks_run() {
  local cmd_env="$1"
  local shell="$2"
  local regex="$3"
  local skip_list="$4"
  local exts="$5"
  shift 5

  local scripts=$(list_dirs "$@" | sort)

  local stack
  for stack in ${scripts}; do
    stack=$(echo $stack | sed -e 's,\..*$,,')
    local rc=$(should_run "${stack}" "${skip_list}")
    if [ $rc -eq 1 ]; then
	local count=$(echo $stack | grep -c "${regex}")
	if [ $count -eq 1 ]; then
	    header "3" "Stack: ${stack}"
	    run_script "${cmd_env}" "${shell}" "" "${stack}" "${exts}" "" "$@"
	    msg
	fi
    fi
  done
}

##############################################################################
#
# Deletes stack who's name starts with stack_prefix
#
# Args:
#   stack_prefix  - Shell glob of stack prefix(es) to delete
#
# Output
#   Status Msgs + ASW CFT errors
#
##############################################################################
stacks_delete() {
  local stack_prefix="$1"

  local stacks=$(aws_stacks_list "${stack_prefix}")
  local stack
  for stack in $stacks; do
    header "15" "Deleting Stack: ${stack}"
    aws_stack_delete "${stack}"
  done
}

ec2_terminate_instance_with_name_tag() {
    local $tag="$1"

    local instance_id=$(aws_ec2_instance_id_from_name_tag "$tag")

    aws_ec2_instance_terminate "$instance_id"
}

password_admin_get() {
    local instance_id="$1"
    local ami_name="$2"
    local key_path="$3"

    local pass

    local i=1
    while [ true ]; do
	local log=$(aws_console_output "${instance_id}")

	case ${ami_name} in
	    *WIN*)
		pass=$(aws_ec2_get_password "${instance_id}" "${key_path}")
		[ -z "${pass}" ] || break

		msg "Waiting...$i"
		msg "${log}"
		i=$(doubling_backoff_retry $i)
		;;
	    *)
		#		msg "${log}"
		break
		;;
	esac
    done

    echo $pass
}

##############################################################################
#
# Map Engine to Port for RDS.
#
# Args:
#   engine               - MySQL|mariadb|aurora
#                          oracle-se1|oracle-se|oracle-ee|
#                          sqlserver-ee|sqlserver-se|sqlserver-ex|sqlserver-web|
#                          postgres
#
# Output:
#  rds port #
#
##############################################################################
rds_port_for_engine() {
  local engine="$1"

  local rds_port
  case ${engine} in
     *sqlserver*)	     rds_port=1433 ;;
     *oracle*)               rds_port=1521 ;;
     *postgres*)             rds_port=5432 ;;
     *mysql|*maria*|*auroa*) rds_port=3306 ;;
  esac

  echo $rds_port
}

##############################################################################
#
# Track Spot Request Cycle
#
# Args:
#  sir - spot request id
#
# Output:
#  none
#
##############################################################################
spot_fulfilled() {
    local sir="$1"

    local prev_code=
    local code=
    while [ x"$code" != x"fulfilled" ]; do
	local code=$(aws --output text ec2 describe-spot-instance-requests --spot-instance-request-ids $sir --query "SpotInstanceRequests[].Status.Code")
	if [ x"$prev_code" != x"$code" ]; then
	    elog "$prev_code -> $code"
	    prev_code=$code
	fi
	sleep 5
    done

    aws --output text ec2 describe-spot-instance-requests --spot-instance-request-ids $sir --query "SpotInstanceRequests[].InstanceId"

    echo $iid
}

ssh_authorized_keys_set() {
    local home="$1"
    local bucket="$2"

    mkdir -p $home/ssh
    aws s3 sync s3://${bucket}/ssh $home/ssh
    cat $home/ssh/*.pub > $home/.ssh/authorized_keys
    rm -rf $home/ssh
}
