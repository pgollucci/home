aws_swf_for_activity_task_poll() {
    local task-list="$1"
    local domain="$2"
    shift 2

    cond_log_and_run aws swf  --task-list $task_list --domain $domain "@"

}
