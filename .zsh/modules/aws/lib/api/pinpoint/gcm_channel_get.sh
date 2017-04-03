aws_pinpoint_gcm_channel_get() {
    local application_id="$1"
    shift 1

    log_and_run aws pinpoint get-gcm-channel --application-id $application_id "$@"
}
