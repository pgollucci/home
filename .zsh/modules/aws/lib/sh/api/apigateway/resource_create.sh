aws_apigateway_resource_create() {
    local rest_api_id="$1"
    local parent_id="$2"
    local path_part="$3"
    shift 3

    cond_log_and_run aws apigateway create-resource --rest-api-id $rest_api_id --parent-id $parent_id --path-part $path_part "$@"
}
