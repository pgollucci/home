aws_iam_policy_versions_list() {
    local policy_arn="$1"
    shift 1

    log_and_run aws iam list-policy-versions --policy-arn $policy_arn "$@"
}
