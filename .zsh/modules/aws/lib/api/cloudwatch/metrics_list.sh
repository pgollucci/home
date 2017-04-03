aws_cloudwatch_metrics_list() {
    shift 0

    log_and_run aws cloudwatch list-metrics "$@"
}
