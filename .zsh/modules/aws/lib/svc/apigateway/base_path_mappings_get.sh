aws_apigateway_base_path_mappings_get() {
    local domain-name="$1"
    shift 1

    log_and_run aws apigateway  --domain-name $domain_name "@"

}
