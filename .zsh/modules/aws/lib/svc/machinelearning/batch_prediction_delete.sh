aws_machinelearning_batch_prediction_delete() {
    local batch-prediction-id="$1"
    shift 1

    cond_log_and_run aws machinelearning  --batch-prediction-id $batch_prediction_id "@"

}
