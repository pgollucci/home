aws_route53domains_domain_detail_get() {
    local domain_name="$1"
    shift 1

    log_and_run aws route53domains get-domain-detail --domain-name $domain_name "$@"
}
