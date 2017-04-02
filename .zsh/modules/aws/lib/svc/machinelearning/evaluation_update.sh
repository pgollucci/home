aws_machinelearning_evaluation_update() {
    local evaluation-name="$1"
    local evaluation-id="$2"
    shift 2

    cond_log_and_run aws machinelearning  --evaluation-name $evaluation_name --evaluation-id $evaluation_id "@"

}
