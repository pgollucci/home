aws_apigateway_documentation_version_get() {
    local rest_api_id="$1"
    local documentation_version="$2"
    shift 2

    log_and_run aws apigateway get-documentation-version --rest-api-id $rest_api_id --documentation-version $documentation_version "$@"
}
