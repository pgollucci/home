aws_apigateway_base_path_mapping_update() {
    local base-path="$1"
    local domain-name="$2"
    shift 2

    cond_log_and_run aws apigateway  --base-path $base_path --domain-name $domain_name "@"

}
