aws_cognito-identity_identities_delete() {
    local identity-ids-to-delete="$1"
    shift 1

    cond_log_and_run aws cognito-identity  --identity-ids-to-delete $identity_ids_to_delete "@"

}
