aws_ecs_service_delete() {
    local service="$1"
    shift 1

    cond_log_and_run aws ecs delete-service --service $service "$@"
}
