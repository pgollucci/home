aws_apigateway_integration_response_put() {
    local status-code="$1"
    local rest-api-id="$2"
    local resource-id="$3"
    local http-method="$4"
    shift 4

    cond_log_and_run aws apigateway  --status-code $status_code --rest-api-id $rest_api_id --resource-id $resource_id --http-method $http_method "@"

}
