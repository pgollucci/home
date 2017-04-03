aws_iam_server_certificate_get() {
    local server_certificate_name="$1"
    shift 1

    log_and_run aws iam get-server-certificate --server-certificate-name $server_certificate_name "$@"
}
