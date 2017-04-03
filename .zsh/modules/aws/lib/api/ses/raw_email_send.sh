aws_ses_raw_email_send() {
    local raw_message="$1"
    shift 1

    cond_log_and_run aws ses send-raw-email --raw-message $raw_message "$@"
}
