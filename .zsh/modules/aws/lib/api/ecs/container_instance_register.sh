aws_ecs_container_instance_register() {
    shift 0

    cond_log_and_run aws ecs register-container-instance "$@"
}
