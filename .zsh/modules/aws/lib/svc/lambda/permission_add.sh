aws_lambda_permission_add() {
    local principal="$1"
    local action="$2"
    local statement-id="$3"
    local function-name="$4"
    shift 4

    cond_log_and_run aws lambda  --principal $principal --action $action --statement-id $statement_id --function-name $function_name "@"

}
