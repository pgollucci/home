aws_iam_role_delete() {
    local role_name="$1"
    shift 1

    cond_log_and_run aws iam delete-role --role-name $role_name "$@"
}
