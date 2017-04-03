aws_machinelearning_evaluation_update() {
    local evaluation_id="$1"
    local evaluation_name="$2"
    shift 2

    cond_log_and_run aws machinelearning update-evaluation --evaluation-id $evaluation_id --evaluation-name $evaluation_name "$@"
}
