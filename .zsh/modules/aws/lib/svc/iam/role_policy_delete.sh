aws_iam_role_policy_delete() {
    local policy-name="$1"
    local role-name="$2"
    shift 2

    cond_log_and_run aws iam  --policy-name $policy_name --role-name $role_name "@"

}
