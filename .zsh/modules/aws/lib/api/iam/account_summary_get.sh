aws_iam_account_summary_get() {
    shift 0

    log_and_run aws iam get-account-summary "$@"
}
