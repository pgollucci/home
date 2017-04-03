aws_pinpoint_apns_channel_get() {
    local application_id="$1"
    shift 1

    log_and_run aws pinpoint get-apns-channel --application-id $application_id "$@"
}
