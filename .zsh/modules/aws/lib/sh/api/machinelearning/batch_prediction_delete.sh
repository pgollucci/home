aws_machinelearning_batch_prediction_delete() {
    local batch_prediction_id="$1"
    shift 1

    cond_log_and_run aws machinelearning delete-batch-prediction --batch-prediction-id $batch_prediction_id "$@"
}
