aws_acm_certificate_request() {
    local domain-name="$1"
    shift 1

    cond_log_and_run aws acm  --domain-name $domain_name "@"

}
