aws_cognito-idp_user_pool_client_create() {
    local user_pool_id="$1"
    local client_name="$2"
    shift 2

    cond_log_and_run aws cognito-idp create-user-pool-client --user-pool-id $user_pool_id --client-name $client_name "$@"
}
