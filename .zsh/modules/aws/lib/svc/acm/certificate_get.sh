aws_acm_certificate_get() {
    local certificate-arn="$1"
    shift 1

    log_and_run aws acm  --certificate-arn $certificate_arn "@"

}
