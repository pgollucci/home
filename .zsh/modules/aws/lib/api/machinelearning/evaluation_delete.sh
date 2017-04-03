aws_machinelearning_evaluation_delete() {
    local evaluation_id="$1"
    shift 1

    cond_log_and_run aws machinelearning delete-evaluation --evaluation-id $evaluation_id "$@"
}
