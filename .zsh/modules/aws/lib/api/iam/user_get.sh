aws_iam_user_get() {
    shift 0

    log_and_run aws iam get-user "$@"
}
