aws_ssm_commands_list() {

    log_and_run aws ssm list-commands "$@"
}
