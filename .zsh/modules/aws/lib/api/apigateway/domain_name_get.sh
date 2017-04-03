aws_apigateway_domain_name_get() {
    local domain_name="$1"
    shift 1

    log_and_run aws apigateway get-domain-name --domain-name $domain_name "$@"
}
