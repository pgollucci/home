aws_athena_query_results_get() {
    local query_execution_id="$1"
    shift 1

    log_and_run aws athena get-query-results --query-execution-id $query_execution_id "$@"
}
