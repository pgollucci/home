aws_cognito_idp_sign_out_global() {

    cond_log_and_run aws cognito-idp global-sign-out "$@"
}
