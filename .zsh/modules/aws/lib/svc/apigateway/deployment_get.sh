aws_apigateway_deployment_get() {
    local rest-api-id="$1"
    local deployment-id="$2"
    shift 2

    log_and_run aws apigateway  --rest-api-id $rest_api_id --deployment-id $deployment_id "@"

}
