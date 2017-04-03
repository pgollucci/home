aws_apigateway_resource_get() {
    local rest_api_id="$1"
    local resource_id="$2"
    shift 2

    log_and_run aws apigateway get-resource --rest-api-id $rest_api_id --resource-id $resource_id "$@"
}
