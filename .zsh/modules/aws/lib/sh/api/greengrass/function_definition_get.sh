aws_greengrass_function_definition_get() {
    local function_definition_id="$1"
    shift 1

    log_and_run aws greengrass get-function-definition --function-definition-id $function_definition_id "$@"
}
