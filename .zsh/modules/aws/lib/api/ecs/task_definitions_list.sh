aws_ecs_task_definitions_list() {
    shift 0

    log_and_run aws ecs list-task-definitions "$@"
}
