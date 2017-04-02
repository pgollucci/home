aws_apigateway_model_update() {
    local rest-api-id="$1"
    local model-name="$2"
    shift 2

    cond_log_and_run aws apigateway  --rest-api-id $rest_api_id --model-name $model_name "@"

}
