aws_ec2_iam_instance_profile_disassociate() {
    local association-id="$1"
    shift 1

    cond_log_and_run aws ec2  --association-id $association_id "@"

}
