aws_apigateway_method_update() {
    local rest-api-id="$1"
    local resource-id="$2"
    local http-method="$3"
    shift 3

    cond_log_and_run aws apigateway  --rest-api-id $rest_api_id --resource-id $resource_id --http-method $http_method "@"

}
