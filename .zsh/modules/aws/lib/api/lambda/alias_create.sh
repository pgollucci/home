aws_lambda_alias_create() {
    local function_name="$1"
    local name="$2"
    local function_version="$3"
    shift 3

    cond_log_and_run aws lambda create-alias --function-name $function_name --name $name --function-version $function_version "$@"
}
