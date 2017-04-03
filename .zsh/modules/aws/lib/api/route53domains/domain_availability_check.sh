aws_route53domains_domain_availability_check() {
    local domain_name="$1"
    shift 1

    cond_log_and_run aws route53domains check-domain-availability --domain-name $domain_name "$@"
}
