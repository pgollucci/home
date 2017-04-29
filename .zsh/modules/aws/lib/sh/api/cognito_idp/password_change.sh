aws_cognito_idp_password_change() {
    local previous_password="$1"
    local proposed_password="$2"
    shift 2

    cond_log_and_run aws cognito-idp change-password --previous-password $previous_password --proposed-password $proposed_password "$@"
}
