aws_machinelearning_ml_model_update() {
    local ml_model_id="$1"
    shift 1

    cond_log_and_run aws machinelearning update-ml-model --ml-model-id $ml_model_id "$@"
}
