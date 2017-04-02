aws_cognito-identity_credentials_for_identity_get() {
    local identity-id="$1"
    shift 1

    log_and_run aws cognito-identity  --identity-id $identity_id "@"

}
