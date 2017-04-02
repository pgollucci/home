aws_lambda_permission_remove() {
    local function-name="$1"
    local statement-id="$2"
    shift 2

    cond_log_and_run aws lambda  --function-name $function_name --statement-id $statement_id "@"

}
