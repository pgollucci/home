aws_greengrass_core_definition_version_create() {
    local core_definition_id="$1"
    shift 1

    cond_log_and_run aws greengrass create-core-definition-version --core-definition-id $core_definition_id "$@"
}
