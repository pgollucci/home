aws_cognito-identity_identity_pool_roles_set() {
    local roles="$1"
    local identity-pool-id="$2"
    shift 2

    cond_log_and_run aws cognito-identity  --roles $roles --identity-pool-id $identity_pool_id "@"

}
