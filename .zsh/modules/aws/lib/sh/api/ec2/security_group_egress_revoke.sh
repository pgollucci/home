aws_ec2_security_group_egress_revoke() {
    local group_id="$1"
    shift 1

    cond_log_and_run aws ec2 revoke-security-group-egress --group-id $group_id "$@"
}
