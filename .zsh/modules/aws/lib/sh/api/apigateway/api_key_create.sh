aws_apigateway_api_key_create() {

    cond_log_and_run aws apigateway create-api-key "$@"
}
