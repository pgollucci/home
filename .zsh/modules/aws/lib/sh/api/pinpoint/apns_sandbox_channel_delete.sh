aws_pinpoint_apns_sandbox_channel_delete() {
    local application_id="$1"
    shift 1

    cond_log_and_run aws pinpoint delete-apns-sandbox-channel --application-id $application_id "$@"
}
