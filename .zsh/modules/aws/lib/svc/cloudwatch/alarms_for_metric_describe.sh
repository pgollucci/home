aws_cloudwatch_alarms_for_metric_describe() {
    local namespace="$1"
    local metric-name="$2"
    shift 2

    log_and_run aws cloudwatch  --namespace $namespace --metric-name $metric_name "@"

}
