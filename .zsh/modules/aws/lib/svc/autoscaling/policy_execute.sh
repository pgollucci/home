aws_autoscaling_policy_execute() {
    local policy-name="$1"
    shift 1

    cond_log_and_run aws autoscaling  --policy-name $policy_name "@"

}
