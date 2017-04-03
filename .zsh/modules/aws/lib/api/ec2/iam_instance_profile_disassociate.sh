aws_ec2_iam_instance_profile_disassociate() {
    local association_id="$1"
    shift 1

    cond_log_and_run aws ec2 disassociate-iam-instance-profile --association-id $association_id "$@"
}
