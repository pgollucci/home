aws_ses_identity_notification_topic_set() {
    local notification-type="$1"
    local identity="$2"
    shift 2

    cond_log_and_run aws ses  --notification-type $notification_type --identity $identity "@"

}
