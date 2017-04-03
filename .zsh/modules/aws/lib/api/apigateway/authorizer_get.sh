aws_apigateway_authorizer_get() {
    local rest_api_id="$1"
    local authorizer_id="$2"
    shift 2

    log_and_run aws apigateway get-authorizer --rest-api-id $rest_api_id --authorizer-id $authorizer_id "$@"
}
