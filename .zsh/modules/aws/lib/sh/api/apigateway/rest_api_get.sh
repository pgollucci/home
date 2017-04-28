aws_apigateway_rest_api_get() {
    local rest_api_id="$1"
    shift 1

    log_and_run aws apigateway get-rest-api --rest-api-id $rest_api_id "$@"
}
