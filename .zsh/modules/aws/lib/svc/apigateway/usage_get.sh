aws_apigateway_usage_get() {
    local end-date="$1"
    local usage-plan-id="$2"
    local start-date="$3"
    shift 3

    log_and_run aws apigateway  --end-date $end_date --usage-plan-id $usage_plan_id --start-date $start_date "@"

}
