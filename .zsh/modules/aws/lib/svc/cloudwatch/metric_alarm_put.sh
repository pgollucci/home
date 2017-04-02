aws_cloudwatch_metric_alarm_put() {
    local evaluation-periods="$1"
    local period="$2"
    local comparison-operator="$3"
    local threshold="$4"
    local alarm-name="$5"
    local metric-name="$6"
    local namespace="$7"
    shift 7

    cond_log_and_run aws cloudwatch  --evaluation-periods $evaluation_periods --period $period --comparison-operator $comparison_operator --threshold $threshold --alarm-name $alarm_name --metric-name $metric_name --namespace $namespace "@"

}
