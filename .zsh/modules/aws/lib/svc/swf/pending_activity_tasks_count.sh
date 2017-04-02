aws_swf_pending_activity_tasks_count() {
    local task-list="$1"
    local domain="$2"
    shift 2

    cond_log_and_run aws swf  --task-list $task_list --domain $domain "@"

}
