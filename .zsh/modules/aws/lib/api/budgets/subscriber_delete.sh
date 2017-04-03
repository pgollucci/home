aws_budgets_subscriber_delete() {
    local account_id="$1"
    local budget_name="$2"
    local notification="$3"
    local subscriber="$4"
    shift 4

    cond_log_and_run aws budgets delete-subscriber --account-id $account_id --budget-name $budget_name --notification $notification --subscriber $subscriber "$@"
}
