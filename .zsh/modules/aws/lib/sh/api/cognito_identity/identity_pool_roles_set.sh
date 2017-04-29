aws_cognito_identity_identity_pool_roles_set() {
    local identity_pool_id="$1"
    local roles="$2"
    shift 2

    cond_log_and_run aws cognito-identity set-identity-pool-roles --identity-pool-id $identity_pool_id --roles $roles "$@"
}
