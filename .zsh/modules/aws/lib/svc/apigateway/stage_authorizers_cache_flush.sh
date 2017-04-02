aws_apigateway_stage_authorizers_cache_flush() {
    local rest-api-id="$1"
    local stage-name="$2"
    shift 2

    cond_log_and_run aws apigateway  --rest-api-id $rest_api_id --stage-name $stage_name "@"

}
