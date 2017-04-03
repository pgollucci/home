aws_events_targets_remove() {
    local rule="$1"
    local ids="$2"
    shift 2

    log_and_run aws events remove-targets --rule $rule --ids $ids "$@"
}
