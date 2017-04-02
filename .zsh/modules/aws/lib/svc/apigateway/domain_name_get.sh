aws_apigateway_domain_name_get() {
    local domain-name="$1"
    shift 1

    log_and_run aws apigateway  --domain-name $domain_name "@"

}
