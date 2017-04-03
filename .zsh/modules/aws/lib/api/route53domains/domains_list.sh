aws_route53domains_domains_list() {
    shift 0

    log_and_run aws route53domains list-domains "$@"
}
