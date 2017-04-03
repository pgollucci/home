aws_iam_account_authorization_details_get() {
    shift 0

    log_and_run aws iam get-account-authorization-details "$@"
}
