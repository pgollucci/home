aws_apigateway_resources_get() {
    local rest_api_id="$1"
    shift 1

    log_and_run aws apigateway get-resources --rest-api-id $rest_api_id "$@"
}
