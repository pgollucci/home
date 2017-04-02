aws_events_rule_names_by_target_list() {
    local target-arn="$1"
    shift 1

    log_and_run aws events  --target-arn $target_arn "@"

}
