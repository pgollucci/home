aws_autoscaling_scheduled_action_delete() {
    local auto_scaling_group_name="$1"
    local scheduled_action_name="$2"
    shift 2

    cond_log_and_run aws autoscaling delete-scheduled-action --auto-scaling-group-name $auto_scaling_group_name --scheduled-action-name $scheduled_action_name "$@"
}
