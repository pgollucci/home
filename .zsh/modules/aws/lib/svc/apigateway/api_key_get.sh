aws_apigateway_api_key_get() {
    local api-key="$1"
    shift 1

    log_and_run aws apigateway  --api-key $api_key "@"

}
