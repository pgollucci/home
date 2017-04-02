aws_cloudwatch_metric_data_put() {
    local namespace="$1"
    shift 1

    cond_log_and_run aws cloudwatch  --namespace $namespace "@"

}
