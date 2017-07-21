aws_apigateway_request_validators_get() {
    local rest_api_id="$1"
    shift 1

    log_and_run aws apigateway get-request-validators --rest-api-id $rest_api_id "$@"
}
