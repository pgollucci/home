aws_ecs_container_instances_describe() {
    local container-instances="$1"
    shift 1

    log_and_run aws ecs  --container-instances $container_instances "@"

}
