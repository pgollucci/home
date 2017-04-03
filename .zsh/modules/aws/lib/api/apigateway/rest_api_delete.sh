aws_apigateway_rest_api_delete() {
    local rest_api_id="$1"
    shift 1

    cond_log_and_run aws apigateway delete-rest-api --rest-api-id $rest_api_id "$@"
}
