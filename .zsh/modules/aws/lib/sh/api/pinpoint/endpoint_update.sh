aws_pinpoint_endpoint_update() {
    local application_id="$1"
    local endpoint_id="$2"
    local endpoint_request="$3"
    shift 3

    cond_log_and_run aws pinpoint update-endpoint --application-id $application_id --endpoint-id $endpoint_id --endpoint-request $endpoint_request "$@"
}
