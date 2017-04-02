aws_iam_context_keys_for_principal_policy_get() {
    local policy-source-arn="$1"
    shift 1

    log_and_run aws iam  --policy-source-arn $policy_source_arn "@"

}
