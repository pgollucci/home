aws_ecs_tasks_describe() {
    local tasks="$1"
    shift 1

    log_and_run aws ecs  --tasks $tasks "@"

}
