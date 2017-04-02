aws_apigateway_base_path_mapping_get() {
    local base-path="$1"
    local domain-name="$2"
    shift 2

    log_and_run aws apigateway  --base-path $base_path --domain-name $domain_name "@"

}
