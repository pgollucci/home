aws_cognito_idp_user_pool_clients_list() {
    local user_pool_id="$1"
    shift 1

    log_and_run aws cognito-idp list-user-pool-clients --user-pool-id $user_pool_id "$@"
}
