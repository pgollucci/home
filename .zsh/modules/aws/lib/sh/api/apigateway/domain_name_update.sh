aws_apigateway_domain_name_update() {
    local domain_name="$1"
    shift 1

    cond_log_and_run aws apigateway update-domain-name --domain-name $domain_name "$@"
}
