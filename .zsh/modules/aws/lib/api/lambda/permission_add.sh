aws_lambda_permission_add() {
    local function_name="$1"
    local statement_id="$2"
    local action="$3"
    local principal="$4"
    shift 4

    cond_log_and_run aws lambda add-permission --function-name $function_name --statement-id $statement_id --action $action --principal $principal "$@"
}
