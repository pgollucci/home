aws_ec2_security_group_references_describe() {
    local group-id="$1"
    shift 1

    log_and_run aws ec2  --group-id $group_id "@"

}
