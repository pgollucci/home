aws_ecs_tasks_list() {
    shift 0

    log_and_run aws ecs list-tasks "$@"
}
