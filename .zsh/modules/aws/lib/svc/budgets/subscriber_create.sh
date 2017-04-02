aws_budgets_subscriber_create() {
    local budget-name="$1"
    local account-id="$2"
    local notification="$3"
    local subscriber="$4"
    shift 4

    cond_log_and_run aws budgets  --budget-name $budget_name --account-id $account_id --notification $notification --subscriber $subscriber "@"

}
