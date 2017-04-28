aws_lightsail_domain_entry_create() {
    local domain_name="$1"
    local domain_entry="$2"
    shift 2

    cond_log_and_run aws lightsail create-domain-entry --domain-name $domain_name --domain-entry $domain_entry "$@"
}
