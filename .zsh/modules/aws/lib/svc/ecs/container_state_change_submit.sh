aws_ecs_container_state_change_submit() {
    shift 0

    cond_log_and_run aws ecs  "@"

}
