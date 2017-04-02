aws_apigateway_resource_create() {
    local path-part="$1"
    local rest-api-id="$2"
    local parent-id="$3"
    shift 3

    cond_log_and_run aws apigateway  --path-part $path_part --rest-api-id $rest_api_id --parent-id $parent_id "@"

}
