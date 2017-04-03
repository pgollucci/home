aws_configure_model_add() {
    local service_model="$1"
    shift 1

    cond_log_and_run aws configure add-model --service-model $service_model "$@"
}
