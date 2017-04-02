aws_apigateway_sdk_type_get() {
    local id="$1"
    shift 1

    log_and_run aws apigateway  --id $id "@"

}
