aws_cognito-idp_password_change() {
    local previous-password="$1"
    local proposed-password="$2"
    shift 2

    cond_log_and_run aws cognito-idp  --previous-password $previous_password --proposed-password $proposed_password "@"

}
