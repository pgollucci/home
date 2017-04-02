aws_iam_role_delete() {
    local role-name="$1"
    shift 1

    cond_log_and_run aws iam  --role-name $role_name "@"

}
