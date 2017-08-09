aws_autoscaling_scaling_policy_put() {
    local auto_scaling_group_name="$1"
    local policy_name="$2"
    shift 2

    cond_log_and_run aws autoscaling put-scaling-policy --auto-scaling-group-name $auto_scaling_group_name --policy-name $policy_name "$@"
}
