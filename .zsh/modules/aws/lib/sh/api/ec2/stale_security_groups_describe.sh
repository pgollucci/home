aws_ec2_stale_security_groups_describe() {
    local vpc_id="$1"
    shift 1

    log_and_run aws ec2 describe-stale-security-groups --vpc-id $vpc_id "$@"
}
