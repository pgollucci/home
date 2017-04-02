aws_machinelearning_evaluation_get() {
    local evaluation-id="$1"
    shift 1

    log_and_run aws machinelearning  --evaluation-id $evaluation_id "@"

}
