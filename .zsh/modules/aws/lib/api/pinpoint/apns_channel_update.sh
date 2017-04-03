aws_pinpoint_apns_channel_update() {
    local apns_channel_request="$1"
    local application_id="$2"
    shift 2

    cond_log_and_run aws pinpoint update-apns-channel --apns-channel-request $apns_channel_request --application-id $application_id "$@"
}
