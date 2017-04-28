aws_iam_policy_delete() {
    local policy_arn="$1"
    shift 1

    cond_log_and_run aws iam delete-policy --policy-arn $policy_arn "$@"
}
