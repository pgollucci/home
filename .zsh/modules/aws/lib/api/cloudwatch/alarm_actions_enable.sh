aws_cloudwatch_alarm_actions_enable() {
    local alarm_names="$1"
    shift 1

    cond_log_and_run aws cloudwatch enable-alarm-actions --alarm-names $alarm_names "$@"
}
