aws_apigateway_api_key_delete() {
    local api-key="$1"
    shift 1

    cond_log_and_run aws apigateway  --api-key $api_key "@"

}
