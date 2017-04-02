aws_ssm_automation_execution_stop() {
    local automation-execution-id="$1"
    shift 1

    cond_log_and_run aws ssm  --automation-execution-id $automation_execution_id "@"

}
