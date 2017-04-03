aws_apigateway_domain_name_delete() {
    local domain_name="$1"
    shift 1

    cond_log_and_run aws apigateway delete-domain-name --domain-name $domain_name "$@"
}
