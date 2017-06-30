aws_greengrass_logger_definition_version_get() {
    local logger_definition_id="$1"
    local logger_definition_version_id="$2"
    shift 2

    log_and_run aws greengrass get-logger-definition-version --logger-definition-id $logger_definition_id --logger-definition-version-id $logger_definition_version_id "$@"
}
