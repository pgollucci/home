aws_lambda_versions_by_function_list() {
    local function-name="$1"
    shift 1

    log_and_run aws lambda  --function-name $function_name "@"

}
