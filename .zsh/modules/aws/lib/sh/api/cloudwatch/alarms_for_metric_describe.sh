aws_cloudwatch_alarms_for_metric_describe() {
    local metric_name="$1"
    local namespace="$2"
    shift 2

    log_and_run aws cloudwatch describe-alarms-for-metric --metric-name $metric_name --namespace $namespace "$@"
}
