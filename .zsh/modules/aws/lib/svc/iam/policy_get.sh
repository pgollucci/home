aws_iam_policy_get() {
    local policy-arn="$1"
    shift 1

    log_and_run aws iam  --policy-arn $policy_arn "@"

}
