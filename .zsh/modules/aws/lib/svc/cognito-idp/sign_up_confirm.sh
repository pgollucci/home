aws_cognito-idp_sign_up_confirm() {
    local username="$1"
    local confirmation-code="$2"
    local client-id="$3"
    shift 3

    cond_log_and_run aws cognito-idp  --username $username --confirmation-code $confirmation_code --client-id $client_id "@"

}
