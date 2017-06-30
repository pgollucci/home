aws_greengrass_logger_definition_delete() {
    local logger_definition_id="$1"
    shift 1

    cond_log_and_run aws greengrass delete-logger-definition --logger-definition-id $logger_definition_id "$@"
}
