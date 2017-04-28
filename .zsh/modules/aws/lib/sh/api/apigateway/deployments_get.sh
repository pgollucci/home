aws_apigateway_deployments_get() {
    local rest_api_id="$1"
    shift 1

    log_and_run aws apigateway get-deployments --rest-api-id $rest_api_id "$@"
}
