aws_pinpoint_gcm_channel_update() {
    local gcm-channel-request="$1"
    local application-id="$2"
    shift 2

    cond_log_and_run aws pinpoint  --gcm-channel-request $gcm_channel_request --application-id $application_id "@"

}
