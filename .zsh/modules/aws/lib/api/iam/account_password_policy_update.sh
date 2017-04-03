aws_iam_account_password_policy_update() {
    shift 0

    cond_log_and_run aws iam update-account-password-policy "$@"
}
