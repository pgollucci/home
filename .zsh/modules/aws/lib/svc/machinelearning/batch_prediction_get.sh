aws_machinelearning_batch_prediction_get() {
    local batch-prediction-id="$1"
    shift 1

    log_and_run aws machinelearning  --batch-prediction-id $batch_prediction_id "@"

}
