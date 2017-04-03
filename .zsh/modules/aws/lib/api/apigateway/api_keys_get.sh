aws_apigateway_api_keys_get() {
    shift 0

    log_and_run aws apigateway get-api-keys "$@"
}
