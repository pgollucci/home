aws_budgets_notification_delete() {
    local account_id="$1"
    local budget_name="$2"
    local notification="$3"
    shift 3

    cond_log_and_run aws budgets delete-notification --account-id $account_id --budget-name $budget_name --notification $notification "$@"
}
