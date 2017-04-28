aws_apigateway_base_path_mapping_create() {
    local domain_name="$1"
    local rest_api_id="$2"
    shift 2

    cond_log_and_run aws apigateway create-base-path-mapping --domain-name $domain_name --rest-api-id $rest_api_id "$@"
}
