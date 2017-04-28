aws_iam_context_keys_for_custom_policy_get() {
    local policy_input_list="$1"
    shift 1

    log_and_run aws iam get-context-keys-for-custom-policy --policy-input-list $policy_input_list "$@"
}
