aws_cognito_sync_bulk_publish_details_get() {
    local identity_pool_id="$1"
    shift 1

    log_and_run aws cognito-sync get-bulk-publish-details --identity-pool-id $identity_pool_id "$@"
}
