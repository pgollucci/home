aws_cloudwatch_metric_alarm_put() {
    local alarm_name="$1"
    local metric_name="$2"
    local namespace="$3"
    local period="$4"
    local evaluation_periods="$5"
    local threshold="$6"
    local comparison_operator="$7"
    shift 7

    cond_log_and_run aws cloudwatch put-metric-alarm --alarm-name $alarm_name --metric-name $metric_name --namespace $namespace --period $period --evaluation-periods $evaluation_periods --threshold $threshold --comparison-operator $comparison_operator "$@"
}
