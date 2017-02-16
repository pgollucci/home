aws_prompt_line() {

  local aws="$(aws_target_prompt_info)"
  local sts="$(aws_sts_prompt_info)"
  [ -n "$aws" ] && echo "${magenta}aws:${norm}$aws"
  [ -n "$sts" ] && echo "${magenta}sts:${norm}$sts"
}

aws_target_prompt_info() {

  if [ -n "$AWS_DEFAULT_PROFILE" ]; then
    echo "   [$AWS_DEFAULT_PROFILE($AWS_ENV/$ENV_LEVEL) - $AWS_DEFAULT_REGION($AWS_VPC)]"
  fi
}

aws_sts_prompt_info() {

    local creds=$HOME/.aws/credentials
    [ -e $creds ] || return

    local mtime=$(command stat -f "%m" $creds)
    local now=$(date "+%s")
    local diff=$(($now-$mtime))

    if [ $diff -gt 3500 ]; then
	echo "   [${red}$diff${norm}s] \c"
    else
	echo "   [${green}$diff${norm}s] \c"
    fi
}

aws_env_level() {

    export ENV_LEVEL=$1
}

aws_env() {
    local env="$1"

    export AWS_ENV=$env
}

aws_profile() {
    local role="$1"

    export AWS_DEFAULT_PROFILE=$role
}

aws_region() {
    local region="$1"

    export AWS_DEFAULT_REGION=$region
}

_shortcut() {
    local profile="$1"
    local region="$2"
    local env="$3"
    local type="$4"

    aws_profile "$profile"
    aws_region "$region"
    aws_env "$env"
}

aws_sts_expire() {

    touch -r ~/README.md ~/.aws/credentials
}

aws_profile() {
    local profile="$1"

    export AWS_DEFAULT_PROFILE=$profile
}

aws_region() {
    local region="$1"

    export AWS_DEFAULT_REGION=$region
}

aws_shortcut() {
    local profile="$1"
    local region="$2"

    aws_profile "$profile"
    aws_region "$region"
}

aws_clear() {
  alias aws && unalias aws
  unset AWS_DEFAULT_PROFILE
  unset AWS_DEFAULT_REGION
  unset AWS_ENV
  unset AWS_VPC
  unset ENV_LEVEL
}

aws_setup() {

    local func
    for func in $(typeset -f |awk '/^[a-z_0-9]+ \(\)/ { print $1 }' |grep awsa_); do
	unset $func
    done

    local profile
    for profile in $(awk '/^\[/ { print }' < ~/.aws/credentials | grep -v default | sed -e 's,[][],,g'); do
	local account=$(echo $profile | cut -d'-' -f 1)

	eval "awsa_${account}() { aws_shortcut \"$profile\" \"us-east-1\" }"
    done
}

aws_sts() {

    local _save_aws_default_profile=$AWS_DEFAULT_PROFILE
    unset AWS_DEFAULT_PROFILE

    ~/bin/sts.py --provider jc --nicks "aws-p6" --login $JC_EMAIL
    ~/bin/sts_map.py p6

    aws_setup

    grep "^\[" ~/.aws/credentials

    AWS_DEFAULT_PROFILE=$_save_aws_default_profile
}

__setup() {

    alias sts='aws_sts'

    aws_setup
}
__setup
