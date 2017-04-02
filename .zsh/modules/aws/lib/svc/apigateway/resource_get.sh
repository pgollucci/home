aws_apigateway_resource_get() {
    local rest-api-id="$1"
    local resource-id="$2"
    shift 2

    log_and_run aws apigateway  --rest-api-id $rest_api_id --resource-id $resource_id "@"

}
