aws_events_rule_disable() {
    local name="$1"
    shift 1

    cond_log_and_run aws events disable-rule --name $name "$@"
}
