aws_iam_login_profile_get() {
    local user_name="$1"
    shift 1

    log_and_run aws iam get-login-profile --user-name $user_name "$@"
}
