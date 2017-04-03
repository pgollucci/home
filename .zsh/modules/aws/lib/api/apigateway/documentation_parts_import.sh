aws_apigateway_documentation_parts_import() {
    local rest_api_id="$1"
    local body="$2"
    shift 2

    cond_log_and_run aws apigateway import-documentation-parts --rest-api-id $rest_api_id --body $body "$@"
}
