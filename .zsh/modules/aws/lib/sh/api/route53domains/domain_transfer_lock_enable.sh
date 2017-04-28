aws_route53domains_domain_transfer_lock_enable() {
    local domain_name="$1"
    shift 1

    cond_log_and_run aws route53domains enable-domain-transfer-lock --domain-name $domain_name "$@"
}
