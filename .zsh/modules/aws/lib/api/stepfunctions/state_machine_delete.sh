aws_stepfunctions_state_machine_delete() {
    local state_machine_arn="$1"
    shift 1

    cond_log_and_run aws stepfunctions delete-state-machine --state-machine-arn $state_machine_arn "$@"
}
