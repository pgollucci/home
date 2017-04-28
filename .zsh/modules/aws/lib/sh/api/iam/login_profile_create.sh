aws_iam_login_profile_create() {
    local user_name="$1"
    local password="$2"
    shift 2

    cond_log_and_run aws iam create-login-profile --user-name $user_name --password $password "$@"
}
