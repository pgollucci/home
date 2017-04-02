aws_health_event_aggregates_describe() {
    local aggregate-field="$1"
    shift 1

    log_and_run aws health  --aggregate-field $aggregate_field "@"

}
