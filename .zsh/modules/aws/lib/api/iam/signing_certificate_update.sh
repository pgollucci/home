aws_iam_signing_certificate_update() {
    local certificate_id="$1"
    local status="$2"
    shift 2

    cond_log_and_run aws iam update-signing-certificate --certificate-id $certificate_id --status $status "$@"
}
