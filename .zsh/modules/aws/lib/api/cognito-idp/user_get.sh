aws_cognito-idp_user_get() {
    shift 0

    log_and_run aws cognito-idp get-user "$@"
}
