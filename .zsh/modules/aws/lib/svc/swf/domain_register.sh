aws_swf_domain_register() {
    local name="$1"
    local workflow-execution-retention-period-in-days="$2"
    shift 2

    cond_log_and_run aws swf  --name $name --workflow-execution-retention-period-in-days $workflow_execution_retention_period_in_days "@"

}
