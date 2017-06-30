aws_greengrass_function_definition_version_create() {
    local function_definition_id="$1"
    shift 1

    cond_log_and_run aws greengrass create-function-definition-version --function-definition-id $function_definition_id "$@"
}
