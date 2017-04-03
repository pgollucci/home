aws_apigateway_resource_delete() {
    local rest_api_id="$1"
    local resource_id="$2"
    shift 2

    cond_log_and_run aws apigateway delete-resource --rest-api-id $rest_api_id --resource-id $resource_id "$@"
}
