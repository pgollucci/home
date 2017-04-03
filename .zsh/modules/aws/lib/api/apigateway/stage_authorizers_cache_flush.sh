aws_apigateway_stage_authorizers_cache_flush() {
    local rest_api_id="$1"
    local stage_name="$2"
    shift 2

    cond_log_and_run aws apigateway flush-stage-authorizers-cache --rest-api-id $rest_api_id --stage-name $stage_name "$@"
}
