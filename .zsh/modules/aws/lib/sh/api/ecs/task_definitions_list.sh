aws_ecs_task_definitions_list() {

    log_and_run aws ecs list-task-definitions "$@"
}
