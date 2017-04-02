aws_iam_user_policy_delete() {
    local policy-name="$1"
    local user-name="$2"
    shift 2

    cond_log_and_run aws iam  --policy-name $policy_name --user-name $user_name "@"

}
