aws_iam_group_policy_detach() {
    local policy-arn="$1"
    local group-name="$2"
    shift 2

    cond_log_and_run aws iam  --policy-arn $policy_arn --group-name $group_name "@"

}
