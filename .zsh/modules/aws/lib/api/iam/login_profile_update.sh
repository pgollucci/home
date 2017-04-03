aws_iam_login_profile_update() {
    local user_name="$1"
    shift 1

    cond_log_and_run aws iam update-login-profile --user-name $user_name "$@"
}
