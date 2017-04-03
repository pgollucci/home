aws_route53domains_billing_view() {
    shift 0

    cond_log_and_run aws route53domains view-billing "$@"
}
