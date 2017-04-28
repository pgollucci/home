aws_events_event_pattern_test() {
    local event_pattern="$1"
    local event="$2"
    shift 2

    cond_log_and_run aws events test-event-pattern --event-pattern $event_pattern --event $event "$@"
}
