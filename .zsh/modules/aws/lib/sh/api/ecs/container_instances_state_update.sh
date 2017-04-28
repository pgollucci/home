aws_ecs_container_instances_state_update() {
    local container_instances="$1"
    local status="$2"
    shift 2

    cond_log_and_run aws ecs update-container-instances-state --container-instances $container_instances --status $status "$@"
}
