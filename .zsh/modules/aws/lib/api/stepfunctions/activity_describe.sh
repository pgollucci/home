aws_stepfunctions_activity_describe() {
    local activity_arn="$1"
    shift 1

    log_and_run aws stepfunctions describe-activity --activity-arn $activity_arn "$@"
}
