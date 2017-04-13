aws_ecs_container_instances_list() {

    log_and_run aws ecs list-container-instances "$@"
}
