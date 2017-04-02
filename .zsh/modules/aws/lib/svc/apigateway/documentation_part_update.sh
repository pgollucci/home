aws_apigateway_documentation_part_update() {
    local rest-api-id="$1"
    local documentation-part-id="$2"
    shift 2

    cond_log_and_run aws apigateway  --rest-api-id $rest_api_id --documentation-part-id $documentation_part_id "@"

}
