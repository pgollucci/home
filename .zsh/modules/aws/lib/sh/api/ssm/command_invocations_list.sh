aws_ssm_command_invocations_list() {

    log_and_run aws ssm list-command-invocations "$@"
}
