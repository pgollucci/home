aws_iam_server_certificates_list() {

    log_and_run aws iam list-server-certificates "$@"
}
