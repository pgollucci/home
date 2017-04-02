aws_lambda_async_invoke() {
    local function-name="$1"
    local invoke-args="$2"
    shift 2

    cond_log_and_run aws lambda  --function-name $function_name --invoke-args $invoke_args "@"

}
