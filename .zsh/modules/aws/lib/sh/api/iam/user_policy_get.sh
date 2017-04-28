aws_iam_user_policy_get() {
    local user_name="$1"
    local policy_name="$2"
    shift 2

    log_and_run aws iam get-user-policy --user-name $user_name --policy-name $policy_name "$@"
}
