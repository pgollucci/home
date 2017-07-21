aws_athena_named_query_get() {
    local named_query_id="$1"
    shift 1

    log_and_run aws athena get-named-query --named-query-id $named_query_id "$@"
}
