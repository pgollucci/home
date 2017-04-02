aws_route53domains_domain_transfer_lock_disable() {
    local domain-name="$1"
    shift 1

    cond_log_and_run aws route53domains  --domain-name $domain_name "@"

}
