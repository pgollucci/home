aws_cognito_idp_user_pool_domain_describe() {
    local domain="$1"
    shift 1

    log_and_run aws cognito-idp describe-user-pool-domain --domain $domain "$@"
}
