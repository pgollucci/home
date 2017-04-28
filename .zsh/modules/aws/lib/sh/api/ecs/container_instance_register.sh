aws_ecs_container_instance_register() {

    cond_log_and_run aws ecs register-container-instance "$@"
}
