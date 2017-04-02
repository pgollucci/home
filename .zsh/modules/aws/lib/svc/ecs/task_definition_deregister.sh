aws_ecs_task_definition_deregister() {
    local task-definition="$1"
    shift 1

    cond_log_and_run aws ecs  --task-definition $task_definition "@"

}
