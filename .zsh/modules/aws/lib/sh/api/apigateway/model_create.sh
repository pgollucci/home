aws_apigateway_model_create() {
    local rest_api_id="$1"
    local name="$2"
    local content_type="$3"
    shift 3

    cond_log_and_run aws apigateway create-model --rest-api-id $rest_api_id --name $name --content-type $content_type "$@"
}
