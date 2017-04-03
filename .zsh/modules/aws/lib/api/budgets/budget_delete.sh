aws_budgets_budget_delete() {
    local account_id="$1"
    local budget_name="$2"
    shift 2

    log_and_run aws budgets delete-budget --account-id $account_id --budget-name $budget_name "$@"
}
