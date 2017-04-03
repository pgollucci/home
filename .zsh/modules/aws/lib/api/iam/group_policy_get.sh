aws_iam_group_policy_get() {
    local group_name="$1"
    local policy_name="$2"
    shift 2

    log_and_run aws iam get-group-policy --group-name $group_name --policy-name $policy_name "$@"
}
