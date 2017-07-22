aws_apigateway_gateway_response_get() {
    local rest_api_id="$1"
    local response_type="$2"
    shift 2

    log_and_run aws apigateway get-gateway-response --rest-api-id $rest_api_id --response-type $response_type "$@"
}
