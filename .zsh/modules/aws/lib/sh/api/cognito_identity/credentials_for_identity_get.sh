aws_cognito_identity_credentials_for_identity_get() {
    local identity_id="$1"
    shift 1

    log_and_run aws cognito-identity get-credentials-for-identity --identity-id $identity_id "$@"
}
