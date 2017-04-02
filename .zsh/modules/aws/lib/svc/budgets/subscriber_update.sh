aws_budgets_subscriber_update() {
    local account-id="$1"
    local old-subscriber="$2"
    local new-subscriber="$3"
    local budget-name="$4"
    local notification="$5"
    shift 5

    cond_log_and_run aws budgets  --account-id $account_id --old-subscriber $old_subscriber --new-subscriber $new_subscriber --budget-name $budget_name --notification $notification "@"

}
