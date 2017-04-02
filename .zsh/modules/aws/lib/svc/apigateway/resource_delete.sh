aws_apigateway_resource_delete() {
    local rest-api-id="$1"
    local resource-id="$2"
    shift 2

    cond_log_and_run aws apigateway  --rest-api-id $rest_api_id --resource-id $resource_id "@"

}
