aws_inspector_cross_account_access_role_describe() {
    shift 0

    log_and_run aws inspector describe-cross-account-access-role "$@"
}
