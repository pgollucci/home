aws_apigateway_model_create() {
    local name="$1"
    local content-type="$2"
    local rest-api-id="$3"
    shift 3

    cond_log_and_run aws apigateway  --name $name --content-type $content_type --rest-api-id $rest_api_id "@"

}
