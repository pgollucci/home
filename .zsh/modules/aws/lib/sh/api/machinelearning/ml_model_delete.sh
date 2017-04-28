aws_machinelearning_ml_model_delete() {
    local ml_model_id="$1"
    shift 1

    cond_log_and_run aws machinelearning delete-ml-model --ml-model-id $ml_model_id "$@"
}
