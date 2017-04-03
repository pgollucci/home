aws_apigateway_client_certificate_get() {
    local client_certificate_id="$1"
    shift 1

    log_and_run aws apigateway get-client-certificate --client-certificate-id $client_certificate_id "$@"
}
