aws_health_event_types_describe() {
    shift 0

    log_and_run aws health describe-event-types "$@"
}
