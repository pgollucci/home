aws_budgets_notification_create() {
    local notification="$1"
    local budget-name="$2"
    local subscribers="$3"
    local account-id="$4"
    shift 4

    cond_log_and_run aws budgets  --notification $notification --budget-name $budget_name --subscribers $subscribers --account-id $account_id "@"

}
