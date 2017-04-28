aws_ecs_task_start() {
    local task_definition="$1"
    local container_instances="$2"
    shift 2

    cond_log_and_run aws ecs start-task --task-definition $task_definition --container-instances $container_instances "$@"
}
