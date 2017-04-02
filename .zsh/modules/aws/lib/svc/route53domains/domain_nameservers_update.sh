aws_route53domains_domain_nameservers_update() {
    local domain-name="$1"
    local nameservers="$2"
    shift 2

    cond_log_and_run aws route53domains  --domain-name $domain_name --nameservers $nameservers "@"

}
