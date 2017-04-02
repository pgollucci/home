aws_iam_user_policy_put() {
    local policy-document="$1"
    local user-name="$2"
    local policy-name="$3"
    shift 3

    cond_log_and_run aws iam  --policy-document $policy_document --user-name $user_name --policy-name $policy_name "@"

}
