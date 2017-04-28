aws_cloudwatch_metric_statistics_get() {
    local namespace="$1"
    local metric_name="$2"
    local start_time="$3"
    local end_time="$4"
    local period="$5"
    shift 5

    log_and_run aws cloudwatch get-metric-statistics --namespace $namespace --metric-name $metric_name --start-time $start_time --end-time $end_time --period $period "$@"
}
