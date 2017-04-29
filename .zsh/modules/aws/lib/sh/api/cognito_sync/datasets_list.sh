aws_cognito_sync_datasets_list() {
    local identity_pool_id="$1"
    local identity_id="$2"
    shift 2

    log_and_run aws cognito-sync list-datasets --identity-pool-id $identity_pool_id --identity-id $identity_id "$@"
}
