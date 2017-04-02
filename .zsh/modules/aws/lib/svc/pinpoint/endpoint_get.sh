aws_pinpoint_endpoint_get() {
    local application-id="$1"
    local endpoint-id="$2"
    shift 2

    log_and_run aws pinpoint  --application-id $application_id --endpoint-id $endpoint_id "@"

}
