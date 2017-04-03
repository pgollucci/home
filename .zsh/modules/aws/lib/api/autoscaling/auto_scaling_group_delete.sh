aws_autoscaling_auto_scaling_group_delete() {
    local auto_scaling_group_name="$1"
    shift 1

    cond_log_and_run aws autoscaling delete-auto-scaling-group --auto-scaling-group-name $auto_scaling_group_name "$@"
}
