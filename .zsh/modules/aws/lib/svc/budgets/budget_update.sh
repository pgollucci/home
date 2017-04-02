aws_budgets_budget_update() {
    local new-budget="$1"
    local account-id="$2"
    shift 2

    log_and_run aws budgets  --new-budget $new_budget --account-id $account_id "@"

}
