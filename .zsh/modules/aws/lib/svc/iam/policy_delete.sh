aws_iam_policy_delete() {
    local policy-arn="$1"
    shift 1

    cond_log_and_run aws iam  --policy-arn $policy_arn "@"

}
