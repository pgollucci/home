aws_logs_metric_filters_describe() {
    shift 0

    log_and_run aws logs describe-metric-filters "$@"
}
