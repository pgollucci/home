aws_lambda_function_get() {
    local function-name="$1"
    shift 1

    log_and_run aws lambda  --function-name $function_name "@"

}
