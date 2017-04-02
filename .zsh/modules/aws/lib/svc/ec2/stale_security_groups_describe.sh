aws_ec2_stale_security_groups_describe() {
    local vpc-id="$1"
    shift 1

    log_and_run aws ec2  --vpc-id $vpc_id "@"

}
