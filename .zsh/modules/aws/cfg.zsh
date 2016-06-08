__setup() {

}

aws_clear() {
  unalias aws
  unset AWS_PROFILE
  unset AWS_ENV
  unset AWS_VPC
  unset ENV_LEVEL
}

aws_prompt_line() {

  local aws="\$(aws_target_prompt_info)"
  local sts="\$(aws_sts_prompt_info)"
  [ -n "$aws" ] && echo "${magenta}aws:${norm}$aws"
  [ -n "$sts" ] && echo "${magenta}sts:${norm}$sts"
}

aws_target_prompt_info() {

  if [ -n "$AWS_PROFILE" ]; then
    echo "   [$AWS_PROFILE($AWS_ENV/$ENV_LEVEL) - $AWS_REGION($AWS_VPC)]"
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

aws_cft_stacks_list() {
    local glob="$1"

    aws --output text cloudformation describe-stacks --query "Stacks[*].{Id: StackId, Name: StackName, Status: StackStatus, Date: CreationTime}" | grep "$glob"
}

aws_cft_stack_delete() {
    local name="$1"

    aws cloudformation delete-stack --stack-name $name
}

aws_rds_snapshot_list() {
    local glob="$1"

    aws --output text rds describe-db-snapshots --query "DBSnapshots[].{VPC:VpcId, DB:DBInstanceIdentifier, Snapshot:DBSnapshotIdentifier, Created:SnapshotCreateTime}" | grep "$glob"
}

aws_sts_expire() {

    touch -r ~/README.md ~/.aws/credentials
}

__setup
