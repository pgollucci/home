aws_cognito-idp_sign_up_confirm() {
    local client_id="$1"
    local username="$2"
    local confirmation_code="$3"
    shift 3

    cond_log_and_run aws cognito-idp confirm-sign-up --client-id $client_id --username $username --confirmation-code $confirmation_code "$@"
}
