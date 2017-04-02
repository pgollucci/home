aws_apigateway_model_get() {
    local model-name="$1"
    local rest-api-id="$2"
    shift 2

    log_and_run aws apigateway  --model-name $model_name --rest-api-id $rest_api_id "@"

}
