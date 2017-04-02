aws_swf_for_decision_task_poll() {
    local domain="$1"
    local task-list="$2"
    shift 2

    cond_log_and_run aws swf  --domain $domain --task-list $task_list "@"

}
