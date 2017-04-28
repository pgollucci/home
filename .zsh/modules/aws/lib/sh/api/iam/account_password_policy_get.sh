aws_iam_account_password_policy_get() {

    log_and_run aws iam get-account-password-policy "$@"
}
