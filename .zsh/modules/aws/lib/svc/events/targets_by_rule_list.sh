aws_events_targets_by_rule_list() {
    local rule="$1"
    shift 1

    log_and_run aws events  --rule $rule "@"

}
