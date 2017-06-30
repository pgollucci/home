aws_greengrass_core_definition_update() {
    local core_definition_id="$1"
    shift 1

    cond_log_and_run aws greengrass update-core-definition --core-definition-id $core_definition_id "$@"
}
