aws_ec2_security_group_create() {
    local description="$1"
    local group_name="$2"
    shift 2

    cond_log_and_run aws ec2 create-security-group --description $description --group-name $group_name "$@"
}
