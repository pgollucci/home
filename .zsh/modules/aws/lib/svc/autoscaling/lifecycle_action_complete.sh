aws_autoscaling_lifecycle_action_complete() {
    local auto-scaling-group-name="$1"
    local lifecycle-action-result="$2"
    local lifecycle-hook-name="$3"
    shift 3

    cond_log_and_run aws autoscaling  --auto-scaling-group-name $auto_scaling_group_name --lifecycle-action-result $lifecycle_action_result --lifecycle-hook-name $lifecycle_hook_name "@"

}
