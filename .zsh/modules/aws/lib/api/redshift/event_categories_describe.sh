aws_redshift_event_categories_describe() {
    shift 0

    log_and_run aws redshift describe-event-categories "$@"
}
