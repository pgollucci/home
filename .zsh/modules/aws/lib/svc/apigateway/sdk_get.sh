aws_apigateway_sdk_get() {
    local sdk-type="$1"
    local rest-api-id="$2"
    local stage-name="$3"
    shift 3

    log_and_run aws apigateway  --sdk-type $sdk_type --rest-api-id $rest_api_id --stage-name $stage_name "@"

}
