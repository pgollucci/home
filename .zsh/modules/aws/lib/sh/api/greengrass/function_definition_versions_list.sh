aws_greengrass_function_definition_versions_list() {
    local function_definition_id="$1"
    shift 1

    log_and_run aws greengrass list-function-definition-versions --function-definition-id $function_definition_id "$@"
}
