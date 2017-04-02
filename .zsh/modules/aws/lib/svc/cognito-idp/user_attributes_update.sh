aws_cognito-idp_user_attributes_update() {
    local user-attributes="$1"
    shift 1

    cond_log_and_run aws cognito-idp  --user-attributes $user_attributes "@"

}
