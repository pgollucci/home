aws_iam_access_keys_list() {
    shift 0

    log_and_run aws iam list-access-keys "$@"
}
