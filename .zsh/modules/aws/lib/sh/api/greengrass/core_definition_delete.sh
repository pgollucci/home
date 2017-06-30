aws_greengrass_core_definition_delete() {
    local core_definition_id="$1"
    shift 1

    cond_log_and_run aws greengrass delete-core-definition --core-definition-id $core_definition_id "$@"
}
