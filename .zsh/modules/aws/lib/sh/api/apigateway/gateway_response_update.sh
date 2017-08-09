aws_apigateway_gateway_response_update() {
    local rest_api_id="$1"
    local response_type="$2"
    shift 2

    cond_log_and_run aws apigateway update-gateway-response --rest-api-id $rest_api_id --response-type $response_type "$@"
}
