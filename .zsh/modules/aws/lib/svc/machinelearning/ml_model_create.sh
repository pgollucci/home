aws_machinelearning_ml_model_create() {
    local training-data-source-id="$1"
    local ml-model-type="$2"
    local ml-model-id="$3"
    shift 3

    cond_log_and_run aws machinelearning  --training-data-source-id $training_data_source_id --ml-model-type $ml_model_type --ml-model-id $ml_model_id "@"

}
