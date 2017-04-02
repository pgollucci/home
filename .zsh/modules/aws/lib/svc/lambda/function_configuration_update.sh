aws_lambda_function_configuration_update() {
    local function-name="$1"
    shift 1

    cond_log_and_run aws lambda  --function-name $function_name "@"

}
