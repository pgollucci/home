aws_redshift_events_describe() {
    shift 0

    log_and_run aws redshift describe-events "$@"
}
