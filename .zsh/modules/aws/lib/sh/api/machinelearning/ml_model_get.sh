aws_machinelearning_ml_model_get() {
    local ml_model_id="$1"
    shift 1

    log_and_run aws machinelearning get-ml-model --ml-model-id $ml_model_id "$@"
}
