aws_iam_role_policy_get() {
    local role_name="$1"
    local policy_name="$2"
    shift 2

    log_and_run aws iam get-role-policy --role-name $role_name --policy-name $policy_name "$@"
}
