aws_autoscaling_policy_delete() {
    local policy-name="$1"
    shift 1

    cond_log_and_run aws autoscaling  --policy-name $policy_name "@"

}
