aws_ecs_container_instance_deregister() {
    local container_instance="$1"
    shift 1

    cond_log_and_run aws ecs deregister-container-instance --container-instance $container_instance "$@"
}
