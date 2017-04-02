aws_apigateway_resource_update() {
    local resource-id="$1"
    local rest-api-id="$2"
    shift 2

    cond_log_and_run aws apigateway  --resource-id $resource_id --rest-api-id $rest_api_id "@"

}
