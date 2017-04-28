aws_apigateway_base_path_mappings_get() {
    local domain_name="$1"
    shift 1

    log_and_run aws apigateway get-base-path-mappings --domain-name $domain_name "$@"
}
