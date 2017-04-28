aws_pinpoint_gcm_channel_delete() {
    local application_id="$1"
    shift 1

    cond_log_and_run aws pinpoint delete-gcm-channel --application-id $application_id "$@"
}
