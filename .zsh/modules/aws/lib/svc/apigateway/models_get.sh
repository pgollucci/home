aws_apigateway_models_get() {
    local rest-api-id="$1"
    shift 1

    log_and_run aws apigateway  --rest-api-id $rest_api_id "@"

}
