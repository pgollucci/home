aws_autoscaling_processes_resume() {
    local auto_scaling_group_name="$1"
    shift 1

    cond_log_and_run aws autoscaling resume-processes --auto-scaling-group-name $auto_scaling_group_name "$@"
}
