aws_stepfunctions_activity_task_get() {
    local activity_arn="$1"
    shift 1

    log_and_run aws stepfunctions get-activity-task --activity-arn $activity_arn "$@"
}
