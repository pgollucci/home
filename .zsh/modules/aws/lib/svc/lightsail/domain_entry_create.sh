aws_lightsail_domain_entry_create() {
    local domain-name="$1"
    local domain-entry="$2"
    shift 2

    cond_log_and_run aws lightsail  --domain-name $domain_name --domain-entry $domain_entry "@"

}
