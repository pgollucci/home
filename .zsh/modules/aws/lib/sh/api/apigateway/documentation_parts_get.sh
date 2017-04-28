aws_apigateway_documentation_parts_get() {
    local rest_api_id="$1"
    shift 1

    log_and_run aws apigateway get-documentation-parts --rest-api-id $rest_api_id "$@"
}
