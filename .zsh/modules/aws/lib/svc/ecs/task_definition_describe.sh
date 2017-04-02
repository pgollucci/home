aws_ecs_task_definition_describe() {
    local task-definition="$1"
    shift 1

    log_and_run aws ecs  --task-definition $task_definition "@"

}
