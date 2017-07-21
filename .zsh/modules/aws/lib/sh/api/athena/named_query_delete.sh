aws_athena_named_query_delete() {
    local named_query_id="$1"
    shift 1

    cond_log_and_run aws athena delete-named-query --named-query-id $named_query_id "$@"
}
