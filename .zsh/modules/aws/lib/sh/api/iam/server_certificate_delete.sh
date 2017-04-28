aws_iam_server_certificate_delete() {
    local server_certificate_name="$1"
    shift 1

    cond_log_and_run aws iam delete-server-certificate --server-certificate-name $server_certificate_name "$@"
}
