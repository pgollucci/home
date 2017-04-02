aws_ses_email_identity_verify() {
    local email-address="$1"
    shift 1

    cond_log_and_run aws ses  --email-address $email_address "@"

}
