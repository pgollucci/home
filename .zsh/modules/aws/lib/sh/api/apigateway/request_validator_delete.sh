aws_apigateway_request_validator_delete() {
    local rest_api_id="$1"
    local request_validator_id="$2"
    shift 2

    cond_log_and_run aws apigateway delete-request-validator --rest-api-id $rest_api_id --request-validator-id $request_validator_id "$@"
}
