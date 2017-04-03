aws_iam_role_policy_attach() {
    local role_name="$1"
    local policy_arn="$2"
    shift 2

    cond_log_and_run aws iam attach-role-policy --role-name $role_name --policy-arn $policy_arn "$@"
}
