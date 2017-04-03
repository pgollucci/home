aws_lambda_versions_by_function_list() {
    local function_name="$1"
    shift 1

    log_and_run aws lambda list-versions-by-function --function-name $function_name "$@"
}
