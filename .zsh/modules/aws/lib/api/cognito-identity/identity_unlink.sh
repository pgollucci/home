aws_cognito-identity_identity_unlink() {
    local identity_id="$1"
    local logins="$2"
    local logins_to_remove="$3"
    shift 3

    cond_log_and_run aws cognito-identity unlink-identity --identity-id $identity_id --logins $logins --logins-to-remove $logins_to_remove "$@"
}
