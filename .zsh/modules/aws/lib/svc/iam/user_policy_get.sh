aws_iam_user_policy_get() {
    local policy-name="$1"
    local user-name="$2"
    shift 2

    log_and_run aws iam  --policy-name $policy_name --user-name $user_name "@"

}
