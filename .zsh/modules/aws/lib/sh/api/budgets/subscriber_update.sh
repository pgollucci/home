aws_budgets_subscriber_update() {
    local account_id="$1"
    local budget_name="$2"
    local notification="$3"
    local old_subscriber="$4"
    local new_subscriber="$5"
    shift 5

    cond_log_and_run aws budgets update-subscriber --account-id $account_id --budget-name $budget_name --notification $notification --old-subscriber $old_subscriber --new-subscriber $new_subscriber "$@"
}
