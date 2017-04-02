aws_budgets_notification_update() {
    local old-notification="$1"
    local new-notification="$2"
    local account-id="$3"
    local budget-name="$4"
    shift 4

    cond_log_and_run aws budgets  --old-notification $old_notification --new-notification $new_notification --account-id $account_id --budget-name $budget_name "@"

}
