aws_pinpoint_apns_channel_update() {
    local application-id="$1"
    local apns-channel-request="$2"
    shift 2

    cond_log_and_run aws pinpoint  --application-id $application_id --apns-channel-request $apns_channel_request "@"

}
