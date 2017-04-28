aws_apigateway_documentation_part_update() {
    local rest_api_id="$1"
    local documentation_part_id="$2"
    shift 2

    cond_log_and_run aws apigateway update-documentation-part --rest-api-id $rest_api_id --documentation-part-id $documentation_part_id "$@"
}
