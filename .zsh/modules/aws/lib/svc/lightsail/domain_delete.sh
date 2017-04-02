aws_lightsail_domain_delete() {
    local domain-name="$1"
    shift 1

    cond_log_and_run aws lightsail  --domain-name $domain_name "@"

}
