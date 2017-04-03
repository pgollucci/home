aws_mturk_bonus_send() {
    local worker_id="$1"
    local bonus_amount="$2"
    local assignment_id="$3"
    shift 3

    cond_log_and_run aws mturk send-bonus --worker-id $worker_id --bonus-amount $bonus_amount --assignment-id $assignment_id "$@"
}
