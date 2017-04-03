aws_apigateway_base_path_mapping_delete() {
    local domain_name="$1"
    local base_path="$2"
    shift 2

    cond_log_and_run aws apigateway delete-base-path-mapping --domain-name $domain_name --base-path $base_path "$@"
}
