aws_iam_group_policy_put() {
    local policy-name="$1"
    local group-name="$2"
    local policy-document="$3"
    shift 3

    cond_log_and_run aws iam  --policy-name $policy_name --group-name $group_name --policy-document $policy_document "@"

}
