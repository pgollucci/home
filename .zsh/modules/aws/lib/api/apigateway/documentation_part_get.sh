aws_apigateway_documentation_part_get() {
    local rest_api_id="$1"
    local documentation_part_id="$2"
    shift 2

    log_and_run aws apigateway get-documentation-part --rest-api-id $rest_api_id --documentation-part-id $documentation_part_id "$@"
}
