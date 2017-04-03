aws_iam_user_create() {
    local user_name="$1"
    shift 1

    cond_log_and_run aws iam create-user --user-name $user_name "$@"
}
