aws_stepfunctions_activity_delete() {
    local activity_arn="$1"
    shift 1

    cond_log_and_run aws stepfunctions delete-activity --activity-arn $activity_arn "$@"
}
