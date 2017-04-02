aws_apigateway_usage_plan_update() {
    local usage-plan-id="$1"
    shift 1

    cond_log_and_run aws apigateway  --usage-plan-id $usage_plan_id "@"

}
