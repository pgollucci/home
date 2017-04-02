aws_iam_user_policy_detach() {
    local policy-arn="$1"
    local user-name="$2"
    shift 2

    cond_log_and_run aws iam  --policy-arn $policy_arn --user-name $user_name "@"

}
