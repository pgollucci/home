aws_apigateway_authorizers_get() {
    local rest_api_id="$1"
    shift 1

    log_and_run aws apigateway get-authorizers --rest-api-id $rest_api_id "$@"
}
