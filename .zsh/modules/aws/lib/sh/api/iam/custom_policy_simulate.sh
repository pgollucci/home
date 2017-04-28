aws_iam_custom_policy_simulate() {
    local policy_input_list="$1"
    local action_names="$2"
    shift 2

    cond_log_and_run aws iam simulate-custom-policy --policy-input-list $policy_input_list --action-names $action_names "$@"
}
