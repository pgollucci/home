aws_cognito-idp_up_sign() {
    local password="$1"
    local client-id="$2"
    local username="$3"
    shift 3

    cond_log_and_run aws cognito-idp  --password $password --client-id $client_id --username $username "@"

}
