aws_pinpoint_endpoint_get() {
    local application_id="$1"
    local endpoint_id="$2"
    shift 2

    log_and_run aws pinpoint get-endpoint --application-id $application_id --endpoint-id $endpoint_id "$@"
}
