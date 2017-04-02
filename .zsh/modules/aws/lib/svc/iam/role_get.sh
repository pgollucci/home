aws_iam_role_get() {
    local role-name="$1"
    shift 1

    log_and_run aws iam  --role-name $role_name "@"

}
