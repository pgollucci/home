aws_machinelearning_evaluation_create() {
    local evaluation-id="$1"
    local evaluation-data-source-id="$2"
    local ml-model-id="$3"
    shift 3

    cond_log_and_run aws machinelearning  --evaluation-id $evaluation_id --evaluation-data-source-id $evaluation_data_source_id --ml-model-id $ml_model_id "@"

}
