aws_cloudwatch_alarm_actions_disable() {
    local alarm_names="$1"
    shift 1

    cond_log_and_run aws cloudwatch disable-alarm-actions --alarm-names $alarm_names "$@"
}
