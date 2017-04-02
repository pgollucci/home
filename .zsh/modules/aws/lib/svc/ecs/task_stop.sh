aws_ecs_task_stop() {
    local task="$1"
    shift 1

    cond_log_and_run aws ecs  --task $task "@"

}
