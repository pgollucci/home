aws_apigateway_invoke_method_test() {
    local http-method="$1"
    local resource-id="$2"
    local rest-api-id="$3"
    shift 3

    cond_log_and_run aws apigateway  --http-method $http_method --resource-id $resource_id --rest-api-id $rest_api_id "@"

}
