aws_iam_login_profile_get() {
    local user-name="$1"
    shift 1

    log_and_run aws iam  --user-name $user_name "@"

}
