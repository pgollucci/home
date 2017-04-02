aws_ssm_command_invocation_get() {
    local command-id="$1"
    local instance-id="$2"
    shift 2

    log_and_run aws ssm  --command-id $command_id --instance-id $instance_id "@"

}
