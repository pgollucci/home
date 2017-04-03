aws_pinpoint_segments_get() {
    local application_id="$1"
    shift 1

    log_and_run aws pinpoint get-segments --application-id $application_id "$@"
}
