aws_apigateway_api_key_update() {
    local api_key="$1"
    shift 1

    cond_log_and_run aws apigateway update-api-key --api-key $api_key "$@"
}
