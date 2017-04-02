aws_autoscaling_scheduled_action_delete() {
    local scheduled-action-name="$1"
    local auto-scaling-group-name="$2"
    shift 2

    cond_log_and_run aws autoscaling  --scheduled-action-name $scheduled_action_name --auto-scaling-group-name $auto_scaling_group_name "@"

}
