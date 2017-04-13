aws_ecs_task_state_change_submit() {

    cond_log_and_run aws ecs submit-task-state-change "$@"
}
