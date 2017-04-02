aws_stepfunctions_execution_start() {
    local state-machine-arn="$1"
    shift 1

    cond_log_and_run aws stepfunctions  --state-machine-arn $state_machine_arn "@"

}
