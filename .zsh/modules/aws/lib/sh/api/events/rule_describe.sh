aws_events_rule_describe() {
    local name="$1"
    shift 1

    log_and_run aws events describe-rule --name $name "$@"
}
