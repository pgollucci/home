aws_apigateway_usage_update() {
    local usage_plan_id="$1"
    local key_id="$2"
    shift 2

    cond_log_and_run aws apigateway update-usage --usage-plan-id $usage_plan_id --key-id $key_id "$@"
}
