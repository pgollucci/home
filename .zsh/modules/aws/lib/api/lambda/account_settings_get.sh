aws_lambda_account_settings_get() {
    shift 0

    log_and_run aws lambda get-account-settings "$@"
}
