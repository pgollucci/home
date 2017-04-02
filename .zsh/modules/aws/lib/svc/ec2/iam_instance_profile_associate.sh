aws_ec2_iam_instance_profile_associate() {
    local instance-id="$1"
    local iam-instance-profile="$2"
    shift 2

    cond_log_and_run aws ec2  --instance-id $instance_id --iam-instance-profile $iam_instance_profile "@"

}
