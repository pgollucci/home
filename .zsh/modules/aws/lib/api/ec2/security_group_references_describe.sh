aws_ec2_security_group_references_describe() {
    local group_id="$1"
    shift 1

    log_and_run aws ec2 describe-security-group-references --group-id $group_id "$@"
}
