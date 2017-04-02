aws_autoscaling_lifecycle_hook_delete() {
    local auto-scaling-group-name="$1"
    local lifecycle-hook-name="$2"
    shift 2

    cond_log_and_run aws autoscaling  --auto-scaling-group-name $auto_scaling_group_name --lifecycle-hook-name $lifecycle_hook_name "@"

}
