aws_apigateway_model_template_get() {
    local rest_api_id="$1"
    local model_name="$2"
    shift 2

    log_and_run aws apigateway get-model-template --rest-api-id $rest_api_id --model-name $model_name "$@"
}
