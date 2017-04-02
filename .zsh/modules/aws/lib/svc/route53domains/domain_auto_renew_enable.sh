aws_route53domains_domain_auto_renew_enable() {
    local domain-name="$1"
    shift 1

    cond_log_and_run aws route53domains  --domain-name $domain_name "@"

}
