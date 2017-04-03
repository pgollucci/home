aws_autoscaling_lifecycle_hooks_describe() {
    local auto_scaling_group_name="$1"
    shift 1

    log_and_run aws autoscaling describe-lifecycle-hooks --auto-scaling-group-name $auto_scaling_group_name "$@"
}
