aws_events_rule_put() {
    local name="$1"
    shift 1

    cond_log_and_run aws events put-rule --name $name "$@"
}
