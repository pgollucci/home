aws_pinpoint_endpoint_update() {
    local application-id="$1"
    local endpoint-id="$2"
    local endpoint-request="$3"
    shift 3

    cond_log_and_run aws pinpoint  --application-id $application_id --endpoint-id $endpoint_id --endpoint-request $endpoint_request "@"

}
