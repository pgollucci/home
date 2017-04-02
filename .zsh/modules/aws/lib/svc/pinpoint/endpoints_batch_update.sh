aws_pinpoint_endpoints_batch_update() {
    local application-id="$1"
    local endpoint-batch-request="$2"
    shift 2

    cond_log_and_run aws pinpoint  --application-id $application_id --endpoint-batch-request $endpoint_batch_request "@"

}
