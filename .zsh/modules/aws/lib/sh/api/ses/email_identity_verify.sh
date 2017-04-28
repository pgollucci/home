aws_ses_email_identity_verify() {
    local email_address="$1"
    shift 1

    cond_log_and_run aws ses verify-email-identity --email-address $email_address "$@"
}
