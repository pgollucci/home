aws_swf_for_activity_task_poll() {
    local domain="$1"
    local task_list="$2"
    shift 2

    cond_log_and_run aws swf poll-for-activity-task --domain $domain --task-list $task_list "$@"
}
