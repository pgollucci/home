aws_autoscaling_metrics_collection_enable() {
    local auto-scaling-group-name="$1"
    local granularity="$2"
    shift 2

    cond_log_and_run aws autoscaling  --auto-scaling-group-name $auto_scaling_group_name --granularity $granularity "@"

}
