aws_stepfunctions_executions_list() {
    local state_machine_arn="$1"
    shift 1

    log_and_run aws stepfunctions list-executions --state-machine-arn $state_machine_arn "$@"
}
