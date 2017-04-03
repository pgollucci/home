aws_swf_for_decision_task_poll() {
    local domain="$1"
    local task_list="$2"
    shift 2

    cond_log_and_run aws swf poll-for-decision-task --domain $domain --task-list $task_list "$@"
}
