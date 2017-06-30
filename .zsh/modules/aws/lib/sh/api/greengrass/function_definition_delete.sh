aws_greengrass_function_definition_delete() {
    local function_definition_id="$1"
    shift 1

    cond_log_and_run aws greengrass delete-function-definition --function-definition-id $function_definition_id "$@"
}
