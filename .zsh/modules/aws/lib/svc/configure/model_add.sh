aws_configure_model_add() {
    local service-model="$1"
    shift 1

    cond_log_and_run aws configure  --service-model $service_model "@"

}
