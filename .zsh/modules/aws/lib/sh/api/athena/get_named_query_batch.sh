aws_athena_get_named_query_batch() {
    local named_query_ids="$1"
    shift 1

    log_and_run aws athena batch-get-named-query --named-query-ids $named_query_ids "$@"
}
