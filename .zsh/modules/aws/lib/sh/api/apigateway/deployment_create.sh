aws_apigateway_deployment_create() {
    local rest_api_id="$1"
    shift 1

    cond_log_and_run aws apigateway create-deployment --rest-api-id $rest_api_id "$@"
}
