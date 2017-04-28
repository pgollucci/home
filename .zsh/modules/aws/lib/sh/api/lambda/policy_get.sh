aws_lambda_policy_get() {
    local function_name="$1"
    shift 1

    log_and_run aws lambda get-policy --function-name $function_name "$@"
}
