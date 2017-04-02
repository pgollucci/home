aws_iam_role_policy_attach() {
    local policy-arn="$1"
    local role-name="$2"
    shift 2

    cond_log_and_run aws iam  --policy-arn $policy_arn --role-name $role_name "@"

}
