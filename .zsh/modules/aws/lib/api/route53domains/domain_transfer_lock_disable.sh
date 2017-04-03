aws_route53domains_domain_transfer_lock_disable() {
    local domain_name="$1"
    shift 1

    cond_log_and_run aws route53domains disable-domain-transfer-lock --domain-name $domain_name "$@"
}
