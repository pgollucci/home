aws_ses_raw_email_send() {
    local raw-message="$1"
    shift 1

    cond_log_and_run aws ses  --raw-message $raw_message "@"

}
