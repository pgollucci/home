aws_apigateway_method_get() {
    local rest_api_id="$1"
    local resource_id="$2"
    local http_method="$3"
    shift 3

    log_and_run aws apigateway get-method --rest-api-id $rest_api_id --resource-id $resource_id --http-method $http_method "$@"
}
