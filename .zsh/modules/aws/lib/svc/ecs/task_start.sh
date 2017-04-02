aws_ecs_task_start() {
    local task-definition="$1"
    local container-instances="$2"
    shift 2

    cond_log_and_run aws ecs  --task-definition $task_definition --container-instances $container_instances "@"

}
