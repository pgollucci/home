aws_iam_assume_role_policy_update() {
    local role-name="$1"
    local policy-document="$2"
    shift 2

    cond_log_and_run aws iam  --role-name $role_name --policy-document $policy_document "@"

}
