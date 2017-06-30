aws_cognito_idp_user_pool_domain_create() {
    local domain="$1"
    local user_pool_id="$2"
    shift 2

    cond_log_and_run aws cognito-idp create-user-pool-domain --domain $domain --user-pool-id $user_pool_id "$@"
}
