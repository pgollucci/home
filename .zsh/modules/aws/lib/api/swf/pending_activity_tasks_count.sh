aws_swf_pending_activity_tasks_count() {
    local domain="$1"
    local task_list="$2"
    shift 2

    cond_log_and_run aws swf count-pending-activity-tasks --domain $domain --task-list $task_list "$@"
}
