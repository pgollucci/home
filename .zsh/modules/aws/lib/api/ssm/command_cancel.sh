aws_ssm_command_cancel() {
    local command_id="$1"
    shift 1

    cond_log_and_run aws ssm cancel-command --command-id $command_id "$@"
}
