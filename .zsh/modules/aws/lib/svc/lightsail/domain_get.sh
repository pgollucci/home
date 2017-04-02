aws_lightsail_domain_get() {
    local domain-name="$1"
    shift 1

    log_and_run aws lightsail  --domain-name $domain_name "@"

}
