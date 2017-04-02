aws_iam_entities_for_policy_list() {
    local policy-arn="$1"
    shift 1

    log_and_run aws iam  --policy-arn $policy_arn "@"

}
