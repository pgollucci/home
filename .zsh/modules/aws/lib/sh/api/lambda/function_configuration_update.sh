aws_lambda_function_configuration_update() {
    local function_name="$1"
    shift 1

    cond_log_and_run aws lambda update-function-configuration --function-name $function_name "$@"
}
