aws_autoscaling_scaling_policy_put() {
    local policy-name="$1"
    local auto-scaling-group-name="$2"
    local adjustment-type="$3"
    shift 3

    cond_log_and_run aws autoscaling  --policy-name $policy_name --auto-scaling-group-name $auto_scaling_group_name --adjustment-type $adjustment_type "@"

}
