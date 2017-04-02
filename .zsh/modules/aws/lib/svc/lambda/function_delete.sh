aws_lambda_function_delete() {
    local function-name="$1"
    shift 1

    cond_log_and_run aws lambda  --function-name $function_name "@"

}
