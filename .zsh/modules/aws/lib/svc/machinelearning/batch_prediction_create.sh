aws_machinelearning_batch_prediction_create() {
    local ml-model-id="$1"
    local output-uri="$2"
    local batch-prediction-id="$3"
    local batch-prediction-data-source-id="$4"
    shift 4

    cond_log_and_run aws machinelearning  --ml-model-id $ml_model_id --output-uri $output_uri --batch-prediction-id $batch_prediction_id --batch-prediction-data-source-id $batch_prediction_data_source_id "@"

}
