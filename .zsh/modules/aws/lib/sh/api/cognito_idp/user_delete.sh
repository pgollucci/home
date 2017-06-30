aws_cognito_idp_user_delete() {
    local access_token="$1"
    shift 1

    cond_log_and_run aws cognito-idp delete-user --access-token $access_token "$@"
}
