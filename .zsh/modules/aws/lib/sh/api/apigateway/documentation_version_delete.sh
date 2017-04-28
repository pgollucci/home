aws_apigateway_documentation_version_delete() {
    local rest_api_id="$1"
    local documentation_version="$2"
    shift 2

    cond_log_and_run aws apigateway delete-documentation-version --rest-api-id $rest_api_id --documentation-version $documentation_version "$@"
}
