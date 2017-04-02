aws_events_event_pattern_test() {
    local event-pattern="$1"
    local event="$2"
    shift 2

    cond_log_and_run aws events  --event-pattern $event_pattern --event $event "@"

}
