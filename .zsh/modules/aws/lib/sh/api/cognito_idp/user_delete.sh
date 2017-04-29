aws_cognito_idp_user_delete() {

    cond_log_and_run aws cognito-idp delete-user "$@"
}
