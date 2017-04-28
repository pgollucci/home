aws_autoscaling_lifecycle_action_heartbeat_record() {
    local lifecycle_hook_name="$1"
    local auto_scaling_group_name="$2"
    shift 2

    cond_log_and_run aws autoscaling record-lifecycle-action-heartbeat --lifecycle-hook-name $lifecycle_hook_name --auto-scaling-group-name $auto_scaling_group_name "$@"
}
