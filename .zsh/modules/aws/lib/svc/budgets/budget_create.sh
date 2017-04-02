aws_budgets_budget_create() {
    local account-id="$1"
    local budget="$2"
    shift 2

    log_and_run aws budgets  --account-id $account_id --budget $budget "@"

}
