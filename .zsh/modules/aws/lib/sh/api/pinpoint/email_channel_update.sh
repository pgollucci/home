aws_pinpoint_email_channel_update() {
    local application_id="$1"
    local email_channel_request="$2"
    shift 2

    cond_log_and_run aws pinpoint update-email-channel --application-id $application_id --email-channel-request $email_channel_request "$@"
}
