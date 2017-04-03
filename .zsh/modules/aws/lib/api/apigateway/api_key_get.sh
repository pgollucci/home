aws_apigateway_api_key_get() {
    local api_key="$1"
    shift 1

    log_and_run aws apigateway get-api-key --api-key $api_key "$@"
}
