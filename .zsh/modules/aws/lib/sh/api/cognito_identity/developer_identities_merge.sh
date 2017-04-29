aws_cognito_identity_developer_identities_merge() {
    local source_user_identifier="$1"
    local destination_user_identifier="$2"
    local developer_provider_name="$3"
    local identity_pool_id="$4"
    shift 4

    cond_log_and_run aws cognito-identity merge-developer-identities --source-user-identifier $source_user_identifier --destination-user-identifier $destination_user_identifier --developer-provider-name $developer_provider_name --identity-pool-id $identity_pool_id "$@"
}
