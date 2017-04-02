aws_ec2_security_group_egress_authorize() {
    local group-id="$1"
    shift 1

    cond_log_and_run aws ec2  --group-id $group_id "@"

}
