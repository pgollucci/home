aws_ses_send_quota_get() {
    shift 0

    log_and_run aws ses get-send-quota "$@"
}
