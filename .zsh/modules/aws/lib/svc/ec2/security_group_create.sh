aws_ec2_security_group_create() {
    local description="$1"
    local group-name="$2"
    shift 2

    cond_log_and_run aws ec2  --description $description --group-name $group_name "@"

}
