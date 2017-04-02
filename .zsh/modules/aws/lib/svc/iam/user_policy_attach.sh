aws_iam_user_policy_attach() {
    local user-name="$1"
    local policy-arn="$2"
    shift 2

    cond_log_and_run aws iam  --user-name $user_name --policy-arn $policy_arn "@"

}
