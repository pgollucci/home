aws_apigateway_method_response_get() {
    local status-code="$1"
    local http-method="$2"
    local rest-api-id="$3"
    local resource-id="$4"
    shift 4

    log_and_run aws apigateway  --status-code $status_code --http-method $http_method --rest-api-id $rest_api_id --resource-id $resource_id "@"

}
