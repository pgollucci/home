aws_stepfunctions_state_machine_describe() {
    local state-machine-arn="$1"
    shift 1

    log_and_run aws stepfunctions  --state-machine-arn $state_machine_arn "@"

}
