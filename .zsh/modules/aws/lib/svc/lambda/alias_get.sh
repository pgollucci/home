aws_lambda_alias_get() {
    local name="$1"
    local function-name="$2"
    shift 2

    log_and_run aws lambda  --name $name --function-name $function_name "@"

}
