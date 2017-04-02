aws_apigateway_documentation_parts_import() {
    local body="$1"
    local rest-api-id="$2"
    shift 2

    cond_log_and_run aws apigateway  --body $body --rest-api-id $rest_api_id "@"

}
