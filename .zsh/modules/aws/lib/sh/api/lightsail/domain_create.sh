aws_lightsail_domain_create() {
    local domain_name="$1"
    shift 1

    cond_log_and_run aws lightsail create-domain --domain-name $domain_name "$@"
}
