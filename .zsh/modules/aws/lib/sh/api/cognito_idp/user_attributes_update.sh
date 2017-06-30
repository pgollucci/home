aws_cognito_idp_user_attributes_update() {
    local user_attributes="$1"
    local access_token="$2"
    shift 2

    cond_log_and_run aws cognito-idp update-user-attributes --user-attributes $user_attributes --access-token $access_token "$@"
}
