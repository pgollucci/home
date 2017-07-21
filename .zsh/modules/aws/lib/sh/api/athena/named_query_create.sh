aws_athena_named_query_create() {
    local name="$1"
    local database="$2"
    local query_string="$3"
    shift 3

    cond_log_and_run aws athena create-named-query --name $name --database $database --query-string $query_string "$@"
}
