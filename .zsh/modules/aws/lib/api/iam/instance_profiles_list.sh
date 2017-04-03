aws_iam_instance_profiles_list() {
    shift 0

    log_and_run aws iam list-instance-profiles "$@"
}
