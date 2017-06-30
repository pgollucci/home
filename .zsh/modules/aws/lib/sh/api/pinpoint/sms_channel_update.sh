aws_pinpoint_sms_channel_update() {
    local application_id="$1"
    local sms_channel_request="$2"
    shift 2

    cond_log_and_run aws pinpoint update-sms-channel --application-id $application_id --sms-channel-request $sms_channel_request "$@"
}
