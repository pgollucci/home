aws_iam_principal_policy_simulate() {
    local policy-source-arn="$1"
    local action-names="$2"
    shift 2

    cond_log_and_run aws iam  --policy-source-arn $policy_source_arn --action-names $action_names "@"

}
