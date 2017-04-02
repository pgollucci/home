aws_cognito-idp_user_pool_client_create() {
    local client-name="$1"
    local user-pool-id="$2"
    shift 2

    cond_log_and_run aws cognito-idp  --client-name $client_name --user-pool-id $user_pool_id "@"

}
