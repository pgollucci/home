aws_iam_entities_for_policy_list() {
    local policy_arn="$1"
    shift 1

    log_and_run aws iam list-entities-for-policy --policy-arn $policy_arn "$@"
}
