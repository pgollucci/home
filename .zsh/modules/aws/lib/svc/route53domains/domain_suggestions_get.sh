aws_route53domains_domain_suggestions_get() {
    local domain-name="$1"
    local suggestion-count="$2"
    local only-available="$3"
    shift 3

    log_and_run aws route53domains  --domain-name $domain_name --suggestion-count $suggestion_count --only-available $only_available "@"

}
