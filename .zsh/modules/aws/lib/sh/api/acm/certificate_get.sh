aws_acm_certificate_get() {
    local certificate_arn="$1"
    shift 1

    log_and_run aws acm get-certificate --certificate-arn $certificate_arn "$@"
}
