aws_acm_certificate_delete() {
    local certificate-arn="$1"
    shift 1

    cond_log_and_run aws acm  --certificate-arn $certificate_arn "@"

}
