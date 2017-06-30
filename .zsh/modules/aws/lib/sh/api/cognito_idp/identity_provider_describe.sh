aws_cognito_idp_identity_provider_describe() {
    local user_pool_id="$1"
    local provider_name="$2"
    shift 2

    log_and_run aws cognito-idp describe-identity-provider --user-pool-id $user_pool_id --provider-name $provider_name "$@"
}
