aws_apigateway_stage_create() {
    local deployment-id="$1"
    local stage-name="$2"
    local rest-api-id="$3"
    shift 3

    cond_log_and_run aws apigateway  --deployment-id $deployment_id --stage-name $stage_name --rest-api-id $rest_api_id "@"

}
