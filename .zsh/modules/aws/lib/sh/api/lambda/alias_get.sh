aws_lambda_alias_get() {
    local function_name="$1"
    local name="$2"
    shift 2

    log_and_run aws lambda get-alias --function-name $function_name --name $name "$@"
}
