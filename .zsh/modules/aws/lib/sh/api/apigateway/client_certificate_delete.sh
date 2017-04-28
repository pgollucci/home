aws_apigateway_client_certificate_delete() {
    local client_certificate_id="$1"
    shift 1

    cond_log_and_run aws apigateway delete-client-certificate --client-certificate-id $client_certificate_id "$@"
}
