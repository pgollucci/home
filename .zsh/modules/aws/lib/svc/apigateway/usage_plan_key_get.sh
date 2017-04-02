aws_apigateway_usage_plan_key_get() {
    local usage-plan-id="$1"
    local key-id="$2"
    shift 2

    log_and_run aws apigateway  --usage-plan-id $usage_plan_id --key-id $key_id "@"

}
