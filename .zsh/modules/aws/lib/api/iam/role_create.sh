aws_iam_role_create() {
    local role_name="$1"
    local assume_role_policy_document="$2"
    shift 2

    cond_log_and_run aws iam create-role --role-name $role_name --assume-role-policy-document $assume_role_policy_document "$@"
}
