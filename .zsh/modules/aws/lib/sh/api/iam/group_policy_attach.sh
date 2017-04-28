aws_iam_group_policy_attach() {
    local group_name="$1"
    local policy_arn="$2"
    shift 2

    cond_log_and_run aws iam attach-group-policy --group-name $group_name --policy-arn $policy_arn "$@"
}
