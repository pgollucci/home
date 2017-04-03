aws_lambda_function_create() {
    local function_name="$1"
    local runtime="$2"
    local role="$3"
    local handler="$4"
    shift 4

    cond_log_and_run aws lambda create-function --function-name $function_name --runtime $runtime --role $role --handler $handler "$@"
}
