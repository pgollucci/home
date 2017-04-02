aws_ses_domain_identity_verify() {
    local domain="$1"
    shift 1

    cond_log_and_run aws ses  --domain $domain "@"

}
