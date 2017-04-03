aws_budgets_budgets_describe() {
    local account_id="$1"
    shift 1

    log_and_run aws budgets describe-budgets --account-id $account_id "$@"
}
