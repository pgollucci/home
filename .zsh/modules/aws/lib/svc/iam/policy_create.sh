aws_iam_policy_create() {
    local policy-document="$1"
    local policy-name="$2"
    shift 2

    cond_log_and_run aws iam  --policy-document $policy_document --policy-name $policy_name "@"

}
