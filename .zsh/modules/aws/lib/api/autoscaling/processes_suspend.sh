aws_autoscaling_processes_suspend() {
    local auto_scaling_group_name="$1"
    shift 1

    cond_log_and_run aws autoscaling suspend-processes --auto-scaling-group-name $auto_scaling_group_name "$@"
}
