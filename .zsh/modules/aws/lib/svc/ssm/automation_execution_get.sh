aws_ssm_automation_execution_get() {
    local automation-execution-id="$1"
    shift 1

    log_and_run aws ssm  --automation-execution-id $automation_execution_id "@"

}
