aws_cloudwatch_alarm_state_set() {
    local state-value="$1"
    local alarm-name="$2"
    local state-reason="$3"
    shift 3

    cond_log_and_run aws cloudwatch  --state-value $state_value --alarm-name $alarm_name --state-reason $state_reason "@"

}
