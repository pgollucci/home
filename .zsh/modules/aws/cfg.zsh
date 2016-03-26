__setup() {

}

aws_clear() {
  unalias aws
  unset AWS_PROFILE
  unset AWS_ENV
  unset AWS_VPC
}

aws_prompt_info() {

  if [ -n "$AWS_PROFILE" ]; then
    echo "[$AWS_PROFILE($AWS_ENV) - $AWS_REGION($AWS_VPC)]"
  fi

}

sts_prompt_info() {

    local creds=$HOME/.aws/credentials

    [ -e $creds ] || return

    local mtime=$(command stat -f "%m" $creds)
    local now=$(date "+%s")
    local diff=$(($now-$mtime))

    if [ $diff -gt 2800 ]; then
	echo "${magenta}sts:   ${red}$diff${norm}s"
    else
	echo "${magenta}sts:   ${green}$diff${norm}s"
    fi
}

__setup
