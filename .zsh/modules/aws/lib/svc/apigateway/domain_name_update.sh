aws_apigateway_domain_name_update() {
    local domain-name="$1"
    shift 1

    cond_log_and_run aws apigateway  --domain-name $domain_name "@"

}
