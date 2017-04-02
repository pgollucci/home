aws_apigateway_method_response_update() {
    local status-code="$1"
    local resource-id="$2"
    local rest-api-id="$3"
    local http-method="$4"
    shift 4

    cond_log_and_run aws apigateway  --status-code $status_code --resource-id $resource_id --rest-api-id $rest_api_id --http-method $http_method "@"

}
