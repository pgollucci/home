aws_acm_certificate_request() {
    local domain_name="$1"
    shift 1

    cond_log_and_run aws acm request-certificate --domain-name $domain_name "$@"
}
