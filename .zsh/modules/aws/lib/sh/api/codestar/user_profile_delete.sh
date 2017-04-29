aws_codestar_user_profile_delete() {
    local user_arn="$1"
    shift 1

    cond_log_and_run aws codestar delete-user-profile --user-arn $user_arn "$@"
}
