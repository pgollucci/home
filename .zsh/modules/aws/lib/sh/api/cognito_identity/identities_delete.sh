aws_cognito_identity_identities_delete() {
    local identity_ids_to_delete="$1"
    shift 1

    cond_log_and_run aws cognito-identity delete-identities --identity-ids-to-delete $identity_ids_to_delete "$@"
}
