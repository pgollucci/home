aws_lightsail_domains_get() {
    shift 0

    log_and_run aws lightsail get-domains "$@"
}
