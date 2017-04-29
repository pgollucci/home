aws_cognito_idp_get_user_admin() {
    local user_pool_id="$1"
    local username="$2"
    shift 2

    log_and_run aws cognito-idp admin-get-user --user-pool-id $user_pool_id --username $username "$@"
}
