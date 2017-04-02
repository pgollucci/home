aws_sqs_permission_add() {
    local label="$1"
    local actions="$2"
    local queue-url="$3"
    local aws-account-ids="$4"
    shift 4

    cond_log_and_run aws sqs  --label $label --actions $actions --queue-url $queue_url --aws-account-ids $aws_account_ids "@"

}
