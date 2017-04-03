aws_ec2_security_group_create() {
    local group_name="$1"
    local description="$2"
    shift 2

    cond_log_and_run aws ec2 create-security-group --group-name $group_name --description $description "$@"
}
