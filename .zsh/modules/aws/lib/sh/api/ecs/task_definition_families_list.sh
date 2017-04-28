aws_ecs_task_definition_families_list() {

    log_and_run aws ecs list-task-definition-families "$@"
}
