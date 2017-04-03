aws_rds_event_subscriptions_describe() {
    shift 0

    log_and_run aws rds describe-event-subscriptions "$@"
}
