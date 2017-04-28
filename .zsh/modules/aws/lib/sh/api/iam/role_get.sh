aws_iam_role_get() {
    local role_name="$1"
    shift 1

    log_and_run aws iam get-role --role-name $role_name "$@"
}
