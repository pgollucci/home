aws_cognito-identity_open_id_token_get() {
    local identity-id="$1"
    shift 1

    log_and_run aws cognito-identity  --identity-id $identity_id "@"

}
