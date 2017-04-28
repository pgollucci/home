aws_apigateway_rest_api_create() {
    local name="$1"
    shift 1

    cond_log_and_run aws apigateway create-rest-api --name $name "$@"
}
