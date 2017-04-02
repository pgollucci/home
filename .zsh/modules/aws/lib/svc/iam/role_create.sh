aws_iam_role_create() {
    local role-name="$1"
    local assume-role-policy-document="$2"
    shift 2

    cond_log_and_run aws iam  --role-name $role_name --assume-role-policy-document $assume_role_policy_document "@"

}
