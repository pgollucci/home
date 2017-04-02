aws_iam_group_policy_delete() {
    local group-name="$1"
    local policy-name="$2"
    shift 2

    cond_log_and_run aws iam  --group-name $group_name --policy-name $policy_name "@"

}
