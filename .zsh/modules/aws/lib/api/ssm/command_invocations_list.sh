aws_ssm_command_invocations_list() {
    shift 0

    log_and_run aws ssm list-command-invocations "$@"
}
