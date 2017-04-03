aws_iam_symbols() {
        shift 0

    cond_log_and_run aws iam update-account-password-policy --require-symbols "$@"
}

aws_iam_numbers() {
        shift 0

    cond_log_and_run aws iam update-account-password-policy --require-numbers "$@"
}

aws_iam_uppercase_characters() {
        shift 0

    cond_log_and_run aws iam update-account-password-policy --require-uppercase-characters "$@"
}

aws_iam_lowercase_characters() {
        shift 0

    cond_log_and_run aws iam update-account-password-policy --require-lowercase-characters "$@"
}

aws_iam_users_to_change_password() {
        shift 0

    cond_log_and_run aws iam update-account-password-policy --allow-users-to-change-password "$@"
}

aws_iam_expiry() {
        shift 0

    cond_log_and_run aws iam update-account-password-policy --hard-expiry "$@"
}

