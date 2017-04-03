aws_health_events_describe() {
    shift 0

    log_and_run aws health describe-events "$@"
}
