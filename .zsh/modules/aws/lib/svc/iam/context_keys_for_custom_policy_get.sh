aws_iam_context_keys_for_custom_policy_get() {
    local policy-input-list="$1"
    shift 1

    log_and_run aws iam  --policy-input-list $policy_input_list "@"

}
