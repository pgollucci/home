aws_apigateway_client_certificate_generate() {

    cond_log_and_run aws apigateway generate-client-certificate "$@"
}
