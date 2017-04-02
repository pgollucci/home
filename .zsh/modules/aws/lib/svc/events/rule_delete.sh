aws_events_rule_delete() {
    local name="$1"
    shift 1

    cond_log_and_run aws events  --name $name "@"

}
