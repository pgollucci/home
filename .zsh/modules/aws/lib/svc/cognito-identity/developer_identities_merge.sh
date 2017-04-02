aws_cognito-identity_developer_identities_merge() {
    local source-user-identifier="$1"
    local destination-user-identifier="$2"
    local developer-provider-name="$3"
    local identity-pool-id="$4"
    shift 4

    cond_log_and_run aws cognito-identity  --source-user-identifier $source_user_identifier --destination-user-identifier $destination_user_identifier --developer-provider-name $developer_provider_name --identity-pool-id $identity_pool_id "@"

}
