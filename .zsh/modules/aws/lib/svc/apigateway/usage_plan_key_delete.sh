aws_apigateway_usage_plan_key_delete() {
    local key-id="$1"
    local usage-plan-id="$2"
    shift 2

    cond_log_and_run aws apigateway  --key-id $key_id --usage-plan-id $usage_plan_id "@"

}
