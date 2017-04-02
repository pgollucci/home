aws_iam_role_policy_get() {
    local policy-name="$1"
    local role-name="$2"
    shift 2

    log_and_run aws iam  --policy-name $policy_name --role-name $role_name "@"

}
