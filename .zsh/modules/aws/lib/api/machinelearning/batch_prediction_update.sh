aws_machinelearning_batch_prediction_update() {
    local batch_prediction_id="$1"
    local batch_prediction_name="$2"
    shift 2

    cond_log_and_run aws machinelearning update-batch-prediction --batch-prediction-id $batch_prediction_id --batch-prediction-name $batch_prediction_name "$@"
}
