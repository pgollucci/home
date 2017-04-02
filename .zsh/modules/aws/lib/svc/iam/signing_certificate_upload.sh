aws_iam_signing_certificate_upload() {
    local certificate-body="$1"
    shift 1

    cond_log_and_run aws iam  --certificate-body $certificate_body "@"

}
