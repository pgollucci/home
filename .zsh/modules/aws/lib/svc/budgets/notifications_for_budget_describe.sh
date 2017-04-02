aws_budgets_notifications_for_budget_describe() {
    local account-id="$1"
    local budget-name="$2"
    shift 2

    log_and_run aws budgets  --account-id $account_id --budget-name $budget_name "@"

}
