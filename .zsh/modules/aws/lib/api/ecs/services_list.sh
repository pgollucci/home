aws_ecs_services_list() {

    log_and_run aws ecs list-services "$@"
}
