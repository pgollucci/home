aws_cognito-idp_confirmation_code_resend() {
    local client-id="$1"
    local username="$2"
    shift 2

    cond_log_and_run aws cognito-idp  --client-id $client_id --username $username "@"

}
