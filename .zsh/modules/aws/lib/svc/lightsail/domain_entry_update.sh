aws_lightsail_domain_entry_update() {
    local domain-entry="$1"
    local domain-name="$2"
    shift 2

    cond_log_and_run aws lightsail  --domain-entry $domain_entry --domain-name $domain_name "@"

}
