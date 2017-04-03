aws_apigateway_usage_plan_key_get() {
    local usage_plan_id="$1"
    local key_id="$2"
    shift 2

    log_and_run aws apigateway get-usage-plan-key --usage-plan-id $usage_plan_id --key-id $key_id "$@"
}
