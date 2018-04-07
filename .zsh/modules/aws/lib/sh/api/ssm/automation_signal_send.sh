aws_ssm_automation_signal_send() {
    local automation_execution_id="$1"
    local signal_type="$2"
    shift 2

    cond_log_and_run aws ssm send-automation-signal --automation-execution-id $automation_execution_id --signal-type $signal_type "$@"
}
