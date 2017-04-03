aws_ecs_container_agent_update() {
    local container_instance="$1"
    shift 1

    cond_log_and_run aws ecs update-container-agent --container-instance $container_instance "$@"
}
