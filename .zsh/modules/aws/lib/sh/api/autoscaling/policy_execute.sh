aws_autoscaling_policy_execute() {
    local policy_name="$1"
    shift 1

    cond_log_and_run aws autoscaling execute-policy --policy-name $policy_name "$@"
}
