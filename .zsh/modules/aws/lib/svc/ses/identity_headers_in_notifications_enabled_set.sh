aws_ses_identity_headers_in_notifications_enabled_set() {
    local enabled="$1"
    local identity="$2"
    local notification-type="$3"
    shift 3

    cond_log_and_run aws ses  --enabled $enabled --identity $identity --notification-type $notification_type "@"

}
