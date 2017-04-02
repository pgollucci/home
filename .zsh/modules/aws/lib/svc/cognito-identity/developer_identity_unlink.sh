aws_cognito-identity_developer_identity_unlink() {
    local developer-user-identifier="$1"
    local identity-id="$2"
    local developer-provider-name="$3"
    local identity-pool-id="$4"
    shift 4

    cond_log_and_run aws cognito-identity  --developer-user-identifier $developer_user_identifier --identity-id $identity_id --developer-provider-name $developer_provider_name --identity-pool-id $identity_pool_id "@"

}
