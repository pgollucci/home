aws_cognito_idp_up_sign() {
    local client_id="$1"
    local username="$2"
    local password="$3"
    shift 3

    cond_log_and_run aws cognito-idp sign-up --client-id $client_id --username $username --password $password "$@"
}
