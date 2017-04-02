aws_lambda_aliases_list() {
    local function-name="$1"
    shift 1

    log_and_run aws lambda  --function-name $function_name "@"

}
