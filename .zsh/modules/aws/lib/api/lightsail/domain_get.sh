aws_lightsail_domain_get() {
    local domain_name="$1"
    shift 1

    log_and_run aws lightsail get-domain --domain-name $domain_name "$@"
}
