__setup() {

    aws_setup
}

aws_clear() {
  unalias aws
  unset AWS_DEFAULT_PROFILE
  unset AWS_DEFAULT_REGION
  unset AWS_ENV
  unset AWS_VPC
  unset ENV_LEVEL
}

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

aws_sts_expire() {

    touch -r ~/README.md ~/.aws/credentials
}

aws_shortcut() {
    local profile="$1"
    local region="$2"

    export AWS_DEFAULT_PROFILE=$profile
    export AWS_DEFAULT_REGION=$region
}

aws_setup() {

    local profile
    for profile in $(awk '/^\[/ { print }' < ~/.aws/credentials | grep -v default | sed -e 's,[][],,g'); do
	local account=$(echo $profile | cut -c 1,4)

	eval "awsa_${account}() { aws_shortcut \"$profile\" \"us-east-1\" }"
    done
}

aws_sts() {

    ~/bin/syts.py
    ~/bin/sts_map.py p6
}


__setup
