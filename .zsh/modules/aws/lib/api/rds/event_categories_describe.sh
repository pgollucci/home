aws_rds_event_categories_describe() {
    shift 0

    log_and_run aws rds describe-event-categories "$@"
}
