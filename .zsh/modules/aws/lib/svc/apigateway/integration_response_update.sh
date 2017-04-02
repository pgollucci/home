aws_apigateway_integration_response_update() {
    local http-method="$1"
    local resource-id="$2"
    local rest-api-id="$3"
    local status-code="$4"
    shift 4

    cond_log_and_run aws apigateway  --http-method $http_method --resource-id $resource_id --rest-api-id $rest_api_id --status-code $status_code "@"

}
