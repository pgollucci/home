aws_ecs_services_list() {
    shift 0

    log_and_run aws ecs list-services "$@"
}
