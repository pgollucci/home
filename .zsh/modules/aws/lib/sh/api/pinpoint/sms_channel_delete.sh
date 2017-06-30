aws_pinpoint_sms_channel_delete() {
    local application_id="$1"
    shift 1

    cond_log_and_run aws pinpoint delete-sms-channel --application-id $application_id "$@"
}
