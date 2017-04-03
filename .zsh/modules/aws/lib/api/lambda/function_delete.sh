aws_lambda_function_delete() {
    local function_name="$1"
    shift 1

    cond_log_and_run aws lambda delete-function --function-name $function_name "$@"
}
