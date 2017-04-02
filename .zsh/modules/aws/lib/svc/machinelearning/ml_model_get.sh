aws_machinelearning_ml_model_get() {
    local ml-model-id="$1"
    shift 1

    log_and_run aws machinelearning  --ml-model-id $ml_model_id "@"

}
