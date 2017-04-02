aws_apigateway_method_response_put() {
    local resource-id="$1"
    local rest-api-id="$2"
    local http-method="$3"
    local status-code="$4"
    shift 4

    cond_log_and_run aws apigateway  --resource-id $resource_id --rest-api-id $rest_api_id --http-method $http_method --status-code $status_code "@"

}
