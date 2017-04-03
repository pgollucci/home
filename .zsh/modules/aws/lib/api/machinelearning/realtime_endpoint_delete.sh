aws_machinelearning_realtime_endpoint_delete() {
    local ml_model_id="$1"
    shift 1

    cond_log_and_run aws machinelearning delete-realtime-endpoint --ml-model-id $ml_model_id "$@"
}
