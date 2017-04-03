aws_cloudwatch_alarm_state_set() {
    local alarm_name="$1"
    local state_value="$2"
    local state_reason="$3"
    shift 3

    cond_log_and_run aws cloudwatch set-alarm-state --alarm-name $alarm_name --state-value $state_value --state-reason $state_reason "$@"
}
