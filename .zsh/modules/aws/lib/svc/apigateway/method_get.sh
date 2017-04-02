aws_apigateway_method_get() {
    local http-method="$1"
    local rest-api-id="$2"
    local resource-id="$3"
    shift 3

    log_and_run aws apigateway  --http-method $http_method --rest-api-id $rest_api_id --resource-id $resource_id "@"

}
