aws_swf_decision_task_completed_respond() {
    local task_token="$1"
    shift 1

    cond_log_and_run aws swf respond-decision-task-completed --task-token $task_token "$@"
}
