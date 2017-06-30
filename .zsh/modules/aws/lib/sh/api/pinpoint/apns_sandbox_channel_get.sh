aws_pinpoint_apns_sandbox_channel_get() {
    local application_id="$1"
    shift 1

    log_and_run aws pinpoint get-apns-sandbox-channel --application-id $application_id "$@"
}
