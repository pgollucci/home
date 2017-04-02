aws_stepfunctions_activity_delete() {
    local activity-arn="$1"
    shift 1

    cond_log_and_run aws stepfunctions  --activity-arn $activity_arn "@"

}
