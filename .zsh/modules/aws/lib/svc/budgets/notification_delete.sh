aws_budgets_notification_delete() {
    local notification="$1"
    local account-id="$2"
    local budget-name="$3"
    shift 3

    cond_log_and_run aws budgets  --notification $notification --account-id $account_id --budget-name $budget_name "@"

}
