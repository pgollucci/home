aws_pinpoint_gcm_channel_delete() {
    local application-id="$1"
    shift 1

    cond_log_and_run aws pinpoint  --application-id $application_id "@"

}
