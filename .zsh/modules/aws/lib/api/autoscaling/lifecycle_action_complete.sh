aws_autoscaling_lifecycle_action_complete() {
    local lifecycle_hook_name="$1"
    local auto_scaling_group_name="$2"
    local lifecycle_action_result="$3"
    shift 3

    cond_log_and_run aws autoscaling complete-lifecycle-action --lifecycle-hook-name $lifecycle_hook_name --auto-scaling-group-name $auto_scaling_group_name --lifecycle-action-result $lifecycle_action_result "$@"
}
