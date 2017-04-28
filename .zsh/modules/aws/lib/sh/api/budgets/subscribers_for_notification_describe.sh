aws_budgets_subscribers_for_notification_describe() {
    local account_id="$1"
    local budget_name="$2"
    local notification="$3"
    shift 3

    log_and_run aws budgets describe-subscribers-for-notification --account-id $account_id --budget-name $budget_name --notification $notification "$@"
}
