aws_pinpoint_gcm_channel_update() {
    local application_id="$1"
    local gcm_channel_request="$2"
    shift 2

    cond_log_and_run aws pinpoint update-gcm-channel --application-id $application_id --gcm-channel-request $gcm_channel_request "$@"
}
