aws_iam_user_update() {
    local user_name="$1"
    shift 1

    cond_log_and_run aws iam update-user --user-name $user_name "$@"
}
