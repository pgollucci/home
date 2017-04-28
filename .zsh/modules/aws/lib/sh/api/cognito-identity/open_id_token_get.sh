aws_cognito-identity_open_id_token_get() {
    local identity_id="$1"
    shift 1

    log_and_run aws cognito-identity get-open-id-token --identity-id $identity_id "$@"
}
