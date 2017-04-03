aws_cognito-identity_developer_identity_unlink() {
    local identity_id="$1"
    local identity_pool_id="$2"
    local developer_provider_name="$3"
    local developer_user_identifier="$4"
    shift 4

    cond_log_and_run aws cognito-identity unlink-developer-identity --identity-id $identity_id --identity-pool-id $identity_pool_id --developer-provider-name $developer_provider_name --developer-user-identifier $developer_user_identifier "$@"
}
