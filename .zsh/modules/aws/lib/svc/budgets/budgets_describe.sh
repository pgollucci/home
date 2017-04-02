aws_budgets_budgets_describe() {
    local account-id="$1"
    shift 1

    log_and_run aws budgets  --account-id $account_id "@"

}
