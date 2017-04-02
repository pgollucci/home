aws_lambda_function_create() {
    local role="$1"
    local function-name="$2"
    local handler="$3"
    local runtime="$4"
    shift 4

    cond_log_and_run aws lambda  --role $role --function-name $function_name --handler $handler --runtime $runtime "@"

}
