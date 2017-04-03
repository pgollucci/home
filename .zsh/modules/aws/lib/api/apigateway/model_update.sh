aws_apigateway_model_update() {
    local rest_api_id="$1"
    local model_name="$2"
    shift 2

    cond_log_and_run aws apigateway update-model --rest-api-id $rest_api_id --model-name $model_name "$@"
}
