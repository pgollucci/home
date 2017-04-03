aws_iam_users_list() {
    shift 0

    log_and_run aws iam list-users "$@"
}
