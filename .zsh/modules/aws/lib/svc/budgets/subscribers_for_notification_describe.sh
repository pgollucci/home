aws_budgets_subscribers_for_notification_describe() {
    local budget-name="$1"
    local account-id="$2"
    local notification="$3"
    shift 3

    log_and_run aws budgets  --budget-name $budget_name --account-id $account_id --notification $notification "@"

}
