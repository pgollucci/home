aws_cognito-sync_identity_pool_usage_list() {
    shift 0

    log_and_run aws cognito-sync list-identity-pool-usage "$@"
}
