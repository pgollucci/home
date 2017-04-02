aws_apigateway_integration_response_delete() {
    local rest-api-id="$1"
    local resource-id="$2"
    local http-method="$3"
    local status-code="$4"
    shift 4

    cond_log_and_run aws apigateway  --rest-api-id $rest_api_id --resource-id $resource_id --http-method $http_method --status-code $status_code "@"

}
