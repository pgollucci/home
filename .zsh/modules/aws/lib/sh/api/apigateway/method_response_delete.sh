aws_apigateway_method_response_delete() {
    local rest_api_id="$1"
    local resource_id="$2"
    local http_method="$3"
    local status_code="$4"
    shift 4

    cond_log_and_run aws apigateway delete-method-response --rest-api-id $rest_api_id --resource-id $resource_id --http-method $http_method --status-code $status_code "$@"
}
