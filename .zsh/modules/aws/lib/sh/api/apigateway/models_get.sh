aws_apigateway_models_get() {
    local rest_api_id="$1"
    shift 1

    log_and_run aws apigateway get-models --rest-api-id $rest_api_id "$@"
}
