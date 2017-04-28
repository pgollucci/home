aws_autoscaling_metrics_collection_disable() {
    local auto_scaling_group_name="$1"
    shift 1

    cond_log_and_run aws autoscaling disable-metrics-collection --auto-scaling-group-name $auto_scaling_group_name "$@"
}
