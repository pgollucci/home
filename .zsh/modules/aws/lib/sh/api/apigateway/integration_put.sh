aws_apigateway_integration_put() {
    local rest_api_id="$1"
    local resource_id="$2"
    local http_method="$3"
    local type="$4"
    shift 4

    cond_log_and_run aws apigateway put-integration --rest-api-id $rest_api_id --resource-id $resource_id --http-method $http_method --type $type "$@"
}
