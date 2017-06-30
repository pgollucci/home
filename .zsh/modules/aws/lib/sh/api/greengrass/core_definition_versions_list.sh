aws_greengrass_core_definition_versions_list() {
    local core_definition_id="$1"
    shift 1

    log_and_run aws greengrass list-core-definition-versions --core-definition-id $core_definition_id "$@"
}
