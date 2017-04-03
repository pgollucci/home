aws_iam_account_password_policy_delete() {
    shift 0

    cond_log_and_run aws iam delete-account-password-policy "$@"
}
