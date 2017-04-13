aws_iam_instance_profiles_list() {

    log_and_run aws iam list-instance-profiles "$@"
}
