aws_ec2_iam_instance_profile_association_replace() {
    local iam-instance-profile="$1"
    local association-id="$2"
    shift 2

    cond_log_and_run aws ec2  --iam-instance-profile $iam_instance_profile --association-id $association_id "@"

}
