aws_cognito-idp_user_delete() {
    shift 0

    cond_log_and_run aws cognito-idp delete-user "$@"
}
