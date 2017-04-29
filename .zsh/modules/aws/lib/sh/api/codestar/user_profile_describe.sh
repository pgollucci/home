aws_codestar_user_profile_describe() {
    local user_arn="$1"
    shift 1

    log_and_run aws codestar describe-user-profile --user-arn $user_arn "$@"
}
