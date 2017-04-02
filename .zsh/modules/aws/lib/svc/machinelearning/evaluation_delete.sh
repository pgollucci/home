aws_machinelearning_evaluation_delete() {
    local evaluation-id="$1"
    shift 1

    cond_log_and_run aws machinelearning  --evaluation-id $evaluation_id "@"

}
