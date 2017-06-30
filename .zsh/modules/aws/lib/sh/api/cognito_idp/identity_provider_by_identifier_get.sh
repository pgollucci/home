aws_cognito_idp_identity_provider_by_identifier_get() {
    local user_pool_id="$1"
    local idp_identifier="$2"
    shift 2

    log_and_run aws cognito-idp get-identity-provider-by-identifier --user-pool-id $user_pool_id --idp-identifier $idp_identifier "$@"
}
