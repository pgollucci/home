aws_ecs_container_agent_update() {
    local container-instance="$1"
    shift 1

    cond_log_and_run aws ecs  --container-instance $container_instance "@"

}
