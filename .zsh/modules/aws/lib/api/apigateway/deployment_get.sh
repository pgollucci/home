aws_apigateway_deployment_get() {
    local rest_api_id="$1"
    local deployment_id="$2"
    shift 2

    log_and_run aws apigateway get-deployment --rest-api-id $rest_api_id --deployment-id $deployment_id "$@"
}
