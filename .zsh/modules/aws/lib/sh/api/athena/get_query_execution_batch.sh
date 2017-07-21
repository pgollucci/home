aws_athena_get_query_execution_batch() {
    local query_execution_ids="$1"
    shift 1

    log_and_run aws athena batch-get-query-execution --query-execution-ids $query_execution_ids "$@"
}
