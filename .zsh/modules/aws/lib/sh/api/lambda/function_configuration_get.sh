aws_lambda_function_configuration_get() {
    local function_name="$1"
    shift 1

    log_and_run aws lambda get-function-configuration --function-name $function_name "$@"
}
