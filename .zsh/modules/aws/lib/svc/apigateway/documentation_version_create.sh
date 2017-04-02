aws_apigateway_documentation_version_create() {
    local rest-api-id="$1"
    local documentation-version="$2"
    shift 2

    cond_log_and_run aws apigateway  --rest-api-id $rest_api_id --documentation-version $documentation_version "@"

}
