aws_autoscaling_scheduled_update_group_action_put() {
    local auto_scaling_group_name="$1"
    local scheduled_action_name="$2"
    shift 2

    cond_log_and_run aws autoscaling put-scheduled-update-group-action --auto-scaling-group-name $auto_scaling_group_name --scheduled-action-name $scheduled_action_name "$@"
}
