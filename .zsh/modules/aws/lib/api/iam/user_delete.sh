aws_iam_user_delete() {
    local user_name="$1"
    shift 1

    cond_log_and_run aws iam delete-user --user-name $user_name "$@"
}
