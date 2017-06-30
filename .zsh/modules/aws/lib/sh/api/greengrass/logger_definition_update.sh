aws_greengrass_logger_definition_update() {
    local logger_definition_id="$1"
    shift 1

    cond_log_and_run aws greengrass update-logger-definition --logger-definition-id $logger_definition_id "$@"
}
