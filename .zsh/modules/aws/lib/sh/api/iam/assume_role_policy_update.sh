aws_iam_assume_role_policy_update() {
    local role_name="$1"
    local policy_document="$2"
    shift 2

    cond_log_and_run aws iam update-assume-role-policy --role-name $role_name --policy-document $policy_document "$@"
}
