aws_budgets_budget_delete() {
    local budget-name="$1"
    local account-id="$2"
    shift 2

    log_and_run aws budgets  --budget-name $budget_name --account-id $account_id "@"

}
