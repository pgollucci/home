aws_organizations_account_describe() {
    local account_id="$1"
    shift 1

    log_and_run aws organizations describe-account --account-id $account_id "$@"
}
