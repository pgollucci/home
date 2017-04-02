aws_ssm_command_cancel() {
    local command-id="$1"
    shift 1

    cond_log_and_run aws ssm  --command-id $command_id "@"

}
