aws_cloudformation_account_limits_describe() {
    shift 0

    log_and_run aws cloudformation describe-account-limits "$@"
}
