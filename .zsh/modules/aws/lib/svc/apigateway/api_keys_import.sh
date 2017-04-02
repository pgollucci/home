aws_apigateway_api_keys_import() {
    local format="$1"
    local body="$2"
    shift 2

    cond_log_and_run aws apigateway  --format $format --body $body "@"

}
