aws_apigateway_client_certificate_update() {
    local client-certificate-id="$1"
    shift 1

    cond_log_and_run aws apigateway  --client-certificate-id $client_certificate_id "@"

}
