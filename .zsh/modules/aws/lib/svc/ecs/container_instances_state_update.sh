aws_ecs_container_instances_state_update() {
    local status="$1"
    local container-instances="$2"
    shift 2

    cond_log_and_run aws ecs  --status $status --container-instances $container_instances "@"

}
