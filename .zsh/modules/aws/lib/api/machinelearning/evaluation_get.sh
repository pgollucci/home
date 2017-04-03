aws_machinelearning_evaluation_get() {
    local evaluation_id="$1"
    shift 1

    log_and_run aws machinelearning get-evaluation --evaluation-id $evaluation_id "$@"
}
