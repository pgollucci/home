aws_greengrass_function_definition_update() {
    local function_definition_id="$1"
    shift 1

    cond_log_and_run aws greengrass update-function-definition --function-definition-id $function_definition_id "$@"
}
