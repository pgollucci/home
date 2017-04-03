aws_cognito-idp_sign_out_global() {
    shift 0

    cond_log_and_run aws cognito-idp global-sign-out "$@"
}
