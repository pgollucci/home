aws_elasticbeanstalk_events_describe() {
    shift 0

    log_and_run aws elasticbeanstalk describe-events "$@"
}
