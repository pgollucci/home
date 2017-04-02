aws_apigateway_integration_delete() {
    local resource-id="$1"
    local rest-api-id="$2"
    local http-method="$3"
    shift 3

    cond_log_and_run aws apigateway  --resource-id $resource_id --rest-api-id $rest_api_id --http-method $http_method "@"

}
