aws_ssm_automation_execution_get() {
    local automation_execution_id="$1"
    shift 1

    log_and_run aws ssm get-automation-execution --automation-execution-id $automation_execution_id "$@"
}
