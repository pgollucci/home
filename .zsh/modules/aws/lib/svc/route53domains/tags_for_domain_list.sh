aws_route53domains_tags_for_domain_list() {
    local domain-name="$1"
    shift 1

    log_and_run aws route53domains  --domain-name $domain_name "@"

}
