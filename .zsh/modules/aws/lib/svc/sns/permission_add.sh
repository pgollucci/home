aws_sns_permission_add() {
    local action-name="$1"
    local aws-account-id="$2"
    local topic-arn="$3"
    local label="$4"
    shift 4

    cond_log_and_run aws sns  --action-name $action_name --aws-account-id $aws_account_id --topic-arn $topic_arn --label $label "@"

}
