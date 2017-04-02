aws_apigateway_client_certificate_generate() {
    shift 0

    cond_log_and_run aws apigateway  "@"

}
