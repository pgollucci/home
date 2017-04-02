aws_iam_group_policy_get() {
    local policy-name="$1"
    local group-name="$2"
    shift 2

    log_and_run aws iam  --policy-name $policy_name --group-name $group_name "@"

}
