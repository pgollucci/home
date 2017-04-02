aws_apigateway_rest_api_delete() {
    local rest-api-id="$1"
    shift 1

    cond_log_and_run aws apigateway  --rest-api-id $rest_api_id "@"

}
