aws_machinelearning_ml_model_create() {
    local ml_model_id="$1"
    local ml_model_type="$2"
    local training_data_source_id="$3"
    shift 3

    cond_log_and_run aws machinelearning create-ml-model --ml-model-id $ml_model_id --ml-model-type $ml_model_type --training-data-source-id $training_data_source_id "$@"
}
