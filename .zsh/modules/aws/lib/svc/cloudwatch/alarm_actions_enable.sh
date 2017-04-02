aws_cloudwatch_alarm_actions_enable() {
    local alarm-names="$1"
    shift 1

    cond_log_and_run aws cloudwatch  --alarm-names $alarm_names "@"

}
