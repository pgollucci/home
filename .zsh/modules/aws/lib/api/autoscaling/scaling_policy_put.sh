aws_autoscaling_scaling_policy_put() {
    local auto_scaling_group_name="$1"
    local policy_name="$2"
    local adjustment_type="$3"
    shift 3

    cond_log_and_run aws autoscaling put-scaling-policy --auto-scaling-group-name $auto_scaling_group_name --policy-name $policy_name --adjustment-type $adjustment_type "$@"
}
