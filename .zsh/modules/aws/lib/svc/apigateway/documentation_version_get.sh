aws_apigateway_documentation_version_get() {
    local documentation-version="$1"
    local rest-api-id="$2"
    shift 2

    log_and_run aws apigateway  --documentation-version $documentation_version --rest-api-id $rest_api_id "@"

}
