aws_iam_server_certificate_upload() {
    local server_certificate_name="$1"
    local certificate_body="$2"
    local private_key="$3"
    shift 3

    cond_log_and_run aws iam upload-server-certificate --server-certificate-name $server_certificate_name --certificate-body $certificate_body --private-key $private_key "$@"
}
