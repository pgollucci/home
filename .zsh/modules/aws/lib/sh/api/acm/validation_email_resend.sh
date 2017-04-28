aws_acm_validation_email_resend() {
    local certificate_arn="$1"
    local domain="$2"
    local validation_domain="$3"
    shift 3

    cond_log_and_run aws acm resend-validation-email --certificate-arn $certificate_arn --domain $domain --validation-domain $validation_domain "$@"
}
