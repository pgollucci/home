aws_opsworks_commands_describe() {
    shift 0

    log_and_run aws opsworks describe-commands "$@"
}
