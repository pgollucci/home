aws_athena_query_execution_get() {
    local query_execution_id="$1"
    shift 1

    log_and_run aws athena get-query-execution --query-execution-id $query_execution_id "$@"
}
