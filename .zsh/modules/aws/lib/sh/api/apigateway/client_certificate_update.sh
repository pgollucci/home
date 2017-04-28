aws_apigateway_client_certificate_update() {
    local client_certificate_id="$1"
    shift 1

    cond_log_and_run aws apigateway update-client-certificate --client-certificate-id $client_certificate_id "$@"
}
