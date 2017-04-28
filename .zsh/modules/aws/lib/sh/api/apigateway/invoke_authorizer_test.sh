aws_apigateway_invoke_authorizer_test() {
    local rest_api_id="$1"
    local authorizer_id="$2"
    shift 2

    cond_log_and_run aws apigateway test-invoke-authorizer --rest-api-id $rest_api_id --authorizer-id $authorizer_id "$@"
}
