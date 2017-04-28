aws_route53domains_domain_renew() {
    local domain_name="$1"
    local current_expiry_year="$2"
    shift 2

    cond_log_and_run aws route53domains renew-domain --domain-name $domain_name --current-expiry-year $current_expiry_year "$@"
}
