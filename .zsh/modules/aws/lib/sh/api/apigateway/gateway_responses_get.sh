aws_apigateway_gateway_responses_get() {
    local rest_api_id="$1"
    shift 1

    log_and_run aws apigateway get-gateway-responses --rest-api-id $rest_api_id "$@"
}
