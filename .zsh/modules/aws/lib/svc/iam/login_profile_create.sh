aws_iam_login_profile_create() {
    local user-name="$1"
    local password="$2"
    shift 2

    cond_log_and_run aws iam  --user-name $user_name --password $password "@"

}
