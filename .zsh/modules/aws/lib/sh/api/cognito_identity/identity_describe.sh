aws_cognito_identity_identity_describe() {
    local identity_id="$1"
    shift 1

    log_and_run aws cognito-identity describe-identity --identity-id $identity_id "$@"
}
