aws_cloudtrail_trails_describe() {
    shift 0

    log_and_run aws cloudtrail describe-trails "$@"
}
