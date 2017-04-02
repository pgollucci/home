aws_iam_signing_certificate_delete() {
    local certificate-id="$1"
    shift 1

    cond_log_and_run aws iam  --certificate-id $certificate_id "@"

}
