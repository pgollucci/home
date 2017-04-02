aws_iam_server_certificate_get() {
    local server-certificate-name="$1"
    shift 1

    log_and_run aws iam  --server-certificate-name $server_certificate_name "@"

}
