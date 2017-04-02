aws_mturk_bonus_send() {
    local assignment-id="$1"
    local worker-id="$2"
    local bonus-amount="$3"
    shift 3

    cond_log_and_run aws mturk  --assignment-id $assignment_id --worker-id $worker_id --bonus-amount $bonus_amount "@"

}
