aws_apigateway_invoke_method_test() {
    local rest_api_id="$1"
    local resource_id="$2"
    local http_method="$3"
    shift 3

    cond_log_and_run aws apigateway test-invoke-method --rest-api-id $rest_api_id --resource-id $resource_id --http-method $http_method "$@"
}
