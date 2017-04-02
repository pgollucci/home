aws_cognito-identity_identity_describe() {
    local identity-id="$1"
    shift 1

    log_and_run aws cognito-identity  --identity-id $identity_id "@"

}
