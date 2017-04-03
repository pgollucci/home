aws_lambda_alias_delete() {
    local function_name="$1"
    local name="$2"
    shift 2

    cond_log_and_run aws lambda delete-alias --function-name $function_name --name $name "$@"
}
