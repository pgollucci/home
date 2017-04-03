aws_cloudwatch_alarms_delete() {
    local alarm_names="$1"
    shift 1

    cond_log_and_run aws cloudwatch delete-alarms --alarm-names $alarm_names "$@"
}
