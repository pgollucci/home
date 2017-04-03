aws_apigateway_usage_plan_key_create() {
    local usage_plan_id="$1"
    local key_id="$2"
    local key_type="$3"
    shift 3

    cond_log_and_run aws apigateway create-usage-plan-key --usage-plan-id $usage_plan_id --key-id $key_id --key-type $key_type "$@"
}
