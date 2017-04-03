aws_lambda_async_invoke() {
    local function_name="$1"
    local invoke_args="$2"
    shift 2

    cond_log_and_run aws lambda invoke-async --function-name $function_name --invoke-args $invoke_args "$@"
}
