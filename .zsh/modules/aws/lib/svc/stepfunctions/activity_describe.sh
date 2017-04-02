aws_stepfunctions_activity_describe() {
    local activity-arn="$1"
    shift 1

    log_and_run aws stepfunctions  --activity-arn $activity_arn "@"

}
