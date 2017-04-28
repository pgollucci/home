aws_ecs_container_state_change_submit() {

    cond_log_and_run aws ecs submit-container-state-change "$@"
}
