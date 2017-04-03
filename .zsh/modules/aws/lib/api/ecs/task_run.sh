aws_ecs_task_run() {
    local task_definition="$1"
    shift 1

    cond_log_and_run aws ecs run-task --task-definition $task_definition "$@"
}
