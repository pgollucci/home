aws_apigateway_usage_plan_key_create() {
    local usage-plan-id="$1"
    local key-id="$2"
    local key-type="$3"
    shift 3

    cond_log_and_run aws apigateway  --usage-plan-id $usage_plan_id --key-id $key_id --key-type $key_type "@"

}
