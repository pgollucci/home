aws_athena_query_execution_stop() {
    local query_execution_id="$1"
    shift 1

    cond_log_and_run aws athena stop-query-execution --query-execution-id $query_execution_id "$@"
}
