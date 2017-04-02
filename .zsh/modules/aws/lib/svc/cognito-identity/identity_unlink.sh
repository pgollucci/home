aws_cognito-identity_identity_unlink() {
    local logins-to-remove="$1"
    local logins="$2"
    local identity-id="$3"
    shift 3

    cond_log_and_run aws cognito-identity  --logins-to-remove $logins_to_remove --logins $logins --identity-id $identity_id "@"

}
