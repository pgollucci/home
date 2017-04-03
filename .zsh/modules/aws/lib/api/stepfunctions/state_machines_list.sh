aws_stepfunctions_state_machines_list() {
    shift 0

    log_and_run aws stepfunctions list-state-machines "$@"
}
