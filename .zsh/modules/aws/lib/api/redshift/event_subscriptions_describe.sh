aws_redshift_event_subscriptions_describe() {
    shift 0

    log_and_run aws redshift describe-event-subscriptions "$@"
}
