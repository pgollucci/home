aws_mturk_workers_notify() {
    local message-text="$1"
    local subject="$2"
    local worker-ids="$3"
    shift 3

    cond_log_and_run aws mturk  --message-text $message_text --subject $subject --worker-ids $worker_ids "@"

}
