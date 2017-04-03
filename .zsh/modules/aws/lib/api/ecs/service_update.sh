aws_ecs_service_update() {
    local service="$1"
    shift 1

    cond_log_and_run aws ecs update-service --service $service "$@"
}
