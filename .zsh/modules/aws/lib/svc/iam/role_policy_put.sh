aws_iam_role_policy_put() {
    local role-name="$1"
    local policy-document="$2"
    local policy-name="$3"
    shift 3

    cond_log_and_run aws iam  --role-name $role_name --policy-document $policy_document --policy-name $policy_name "@"

}
