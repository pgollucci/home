aws_iam_access_keys_list() {

    log_and_run aws iam list-access-keys "$@"
}
