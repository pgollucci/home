aws_budgets_subscriber_delete() {
    local subscriber="$1"
    local notification="$2"
    local account-id="$3"
    local budget-name="$4"
    shift 4

    cond_log_and_run aws budgets  --subscriber $subscriber --notification $notification --account-id $account_id --budget-name $budget_name "@"

}
