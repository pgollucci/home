aws_budgets_budget_update() {
    local account_id="$1"
    local new_budget="$2"
    shift 2

    log_and_run aws budgets update-budget --account-id $account_id --new-budget $new_budget "$@"
}
