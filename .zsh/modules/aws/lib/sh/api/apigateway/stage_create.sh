aws_apigateway_stage_create() {
    local rest_api_id="$1"
    local stage_name="$2"
    local deployment_id="$3"
    shift 3

    cond_log_and_run aws apigateway create-stage --rest-api-id $rest_api_id --stage-name $stage_name --deployment-id $deployment_id "$@"
}
