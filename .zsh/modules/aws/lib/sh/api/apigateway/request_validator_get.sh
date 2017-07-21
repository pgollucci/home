aws_apigateway_request_validator_get() {
    local rest_api_id="$1"
    local request_validator_id="$2"
    shift 2

    log_and_run aws apigateway get-request-validator --rest-api-id $rest_api_id --request-validator-id $request_validator_id "$@"
}
