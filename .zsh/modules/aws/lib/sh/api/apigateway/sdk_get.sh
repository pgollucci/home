aws_apigateway_sdk_get() {
    local rest_api_id="$1"
    local stage_name="$2"
    local sdk_type="$3"
    shift 3

    log_and_run aws apigateway get-sdk --rest-api-id $rest_api_id --stage-name $stage_name --sdk-type $sdk_type "$@"
}
