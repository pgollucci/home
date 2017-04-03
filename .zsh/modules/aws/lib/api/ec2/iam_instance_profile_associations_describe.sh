aws_ec2_iam_instance_profile_associations_describe() {
    shift 0

    log_and_run aws ec2 describe-iam-instance-profile-associations "$@"
}
