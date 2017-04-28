aws_ses_domain_dkim_verify() {
    local domain="$1"
    shift 1

    cond_log_and_run aws ses verify-domain-dkim --domain $domain "$@"
}
