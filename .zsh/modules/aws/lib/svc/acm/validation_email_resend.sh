aws_acm_validation_email_resend() {
    local domain="$1"
    local validation-domain="$2"
    local certificate-arn="$3"
    shift 3

    cond_log_and_run aws acm  --domain $domain --validation-domain $validation_domain --certificate-arn $certificate_arn "@"

}
