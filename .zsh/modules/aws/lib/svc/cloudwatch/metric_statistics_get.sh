aws_cloudwatch_metric_statistics_get() {
    local period="$1"
    local metric-name="$2"
    local namespace="$3"
    local start-time="$4"
    local end-time="$5"
    shift 5

    log_and_run aws cloudwatch  --period $period --metric-name $metric_name --namespace $namespace --start-time $start_time --end-time $end_time "@"

}
