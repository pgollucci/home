aws_autoscaling_policy_delete() {
    local policy_name="$1"
    shift 1

    cond_log_and_run aws autoscaling delete-policy --policy-name $policy_name "$@"
}
