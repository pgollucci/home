aws_sns_permission_add() {
    local topic_arn="$1"
    local label="$2"
    local aws_account_id="$3"
    local action_name="$4"
    shift 4

    cond_log_and_run aws sns add-permission --topic-arn $topic_arn --label $label --aws-account-id $aws_account_id --action-name $action_name "$@"
}
