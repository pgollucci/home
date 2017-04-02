aws_iam_user_update() {
    local user-name="$1"
    shift 1

    cond_log_and_run aws iam  --user-name $user_name "@"

}
