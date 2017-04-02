aws_ecs_task_definition_register() {
    local container-definitions="$1"
    local family="$2"
    shift 2

    cond_log_and_run aws ecs  --container-definitions $container_definitions --family $family "@"

}
