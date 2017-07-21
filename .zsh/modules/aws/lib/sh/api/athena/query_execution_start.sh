aws_athena_query_execution_start() {
    local query_string="$1"
    local result_configuration="$2"
    shift 2

    cond_log_and_run aws athena start-query-execution --query-string $query_string --result-configuration $result_configuration "$@"
}
