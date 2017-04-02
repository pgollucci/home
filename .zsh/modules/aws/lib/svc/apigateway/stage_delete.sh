aws_apigateway_stage_delete() {
    local stage-name="$1"
    local rest-api-id="$2"
    shift 2

    cond_log_and_run aws apigateway  --stage-name $stage_name --rest-api-id $rest_api_id "@"

}
