aws_cloudtrail_events_lookup() {
    shift 0

    cond_log_and_run aws cloudtrail  "@"

}
