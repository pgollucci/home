aws_iam_context_keys_for_principal_policy_get() {
    local policy_source_arn="$1"
    shift 1

    log_and_run aws iam get-context-keys-for-principal-policy --policy-source-arn $policy_source_arn "$@"
}
