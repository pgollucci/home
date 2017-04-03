aws_cognito-identity_identity_pool_delete() {
    local identity_pool_id="$1"
    shift 1

    cond_log_and_run aws cognito-identity delete-identity-pool --identity-pool-id $identity_pool_id "$@"
}
