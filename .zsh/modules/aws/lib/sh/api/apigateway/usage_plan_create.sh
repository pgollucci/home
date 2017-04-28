aws_apigateway_usage_plan_create() {
    local name="$1"
    shift 1

    cond_log_and_run aws apigateway create-usage-plan --name $name "$@"
}
