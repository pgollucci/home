aws_iam_server_certificate_upload() {
    local private-key="$1"
    local server-certificate-name="$2"
    local certificate-body="$3"
    shift 3

    cond_log_and_run aws iam  --private-key $private_key --server-certificate-name $server_certificate_name --certificate-body $certificate_body "@"

}
