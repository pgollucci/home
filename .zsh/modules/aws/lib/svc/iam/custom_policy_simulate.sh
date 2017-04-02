aws_iam_custom_policy_simulate() {
    local action-names="$1"
    local policy-input-list="$2"
    shift 2

    cond_log_and_run aws iam  --action-names $action_names --policy-input-list $policy_input_list "@"

}
