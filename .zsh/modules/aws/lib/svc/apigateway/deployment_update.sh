aws_apigateway_deployment_update() {
    local rest-api-id="$1"
    local deployment-id="$2"
    shift 2

    cond_log_and_run aws apigateway  --rest-api-id $rest_api_id --deployment-id $deployment_id "@"

}
