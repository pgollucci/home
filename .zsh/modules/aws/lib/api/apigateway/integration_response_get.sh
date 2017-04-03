aws_apigateway_integration_response_get() {
    local rest_api_id="$1"
    local resource_id="$2"
    local http_method="$3"
    local status_code="$4"
    shift 4

    log_and_run aws apigateway get-integration-response --rest-api-id $rest_api_id --resource-id $resource_id --http-method $http_method --status-code $status_code "$@"
}
