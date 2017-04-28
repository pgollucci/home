aws_pinpoint_endpoints_batch_update() {
    local application_id="$1"
    local endpoint_batch_request="$2"
    shift 2

    cond_log_and_run aws pinpoint update-endpoints-batch --application-id $application_id --endpoint-batch-request $endpoint_batch_request "$@"
}
