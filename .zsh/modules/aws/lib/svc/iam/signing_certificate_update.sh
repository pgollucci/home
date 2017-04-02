aws_iam_signing_certificate_update() {
    local certificate-id="$1"
    local status="$2"
    shift 2

    cond_log_and_run aws iam  --certificate-id $certificate_id --status $status "@"

}
