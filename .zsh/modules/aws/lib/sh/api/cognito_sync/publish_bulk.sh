aws_cognito_sync_publish_bulk() {
    local identity_pool_id="$1"
    shift 1

    cond_log_and_run aws cognito-sync bulk-publish --identity-pool-id $identity_pool_id "$@"
}
