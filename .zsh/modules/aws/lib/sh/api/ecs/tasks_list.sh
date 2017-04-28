aws_ecs_tasks_list() {

    log_and_run aws ecs list-tasks "$@"
}
