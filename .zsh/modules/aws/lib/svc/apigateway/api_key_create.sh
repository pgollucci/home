aws_apigateway_api_key_create() {
    shift 0

    cond_log_and_run aws apigateway  "@"

}
