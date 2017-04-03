aws_apigateway_stage_get() {
    local rest_api_id="$1"
    local stage_name="$2"
    shift 2

    log_and_run aws apigateway get-stage --rest-api-id $rest_api_id --stage-name $stage_name "$@"
}
