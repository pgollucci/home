aws_apigateway_authorizer_delete() {
    local rest-api-id="$1"
    local authorizer-id="$2"
    shift 2

    cond_log_and_run aws apigateway  --rest-api-id $rest_api_id --authorizer-id $authorizer_id "@"

}
