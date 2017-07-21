aws_apigateway_request_validator_create() {
    local rest_api_id="$1"
    shift 1

    cond_log_and_run aws apigateway create-request-validator --rest-api-id $rest_api_id "$@"
}
