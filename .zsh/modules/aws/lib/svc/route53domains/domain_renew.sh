aws_route53domains_domain_renew() {
    local current-expiry-year="$1"
    local domain-name="$2"
    shift 2

    cond_log_and_run aws route53domains  --current-expiry-year $current_expiry_year --domain-name $domain_name "@"

}
