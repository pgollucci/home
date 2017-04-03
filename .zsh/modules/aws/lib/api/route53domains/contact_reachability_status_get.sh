aws_route53domains_contact_reachability_status_get() {
    shift 0

    log_and_run aws route53domains get-contact-reachability-status "$@"
}
