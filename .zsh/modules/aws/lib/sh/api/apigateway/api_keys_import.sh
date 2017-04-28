aws_apigateway_api_keys_import() {
    local body="$1"
    local format="$2"
    shift 2

    cond_log_and_run aws apigateway import-api-keys --body $body --format $format "$@"
}
