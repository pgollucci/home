aws_apigateway_documentation_part_get() {
    local documentation-part-id="$1"
    local rest-api-id="$2"
    shift 2

    log_and_run aws apigateway  --documentation-part-id $documentation_part_id --rest-api-id $rest_api_id "@"

}
