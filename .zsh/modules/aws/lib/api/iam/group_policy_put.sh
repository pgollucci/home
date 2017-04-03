aws_iam_group_policy_put() {
    local group_name="$1"
    local policy_name="$2"
    local policy_document="$3"
    shift 3

    cond_log_and_run aws iam put-group-policy --group-name $group_name --policy-name $policy_name --policy-document $policy_document "$@"
}
