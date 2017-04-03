aws_iam_open_id_connect_providers_list() {
    shift 0

    log_and_run aws iam list-open-id-connect-providers "$@"
}
