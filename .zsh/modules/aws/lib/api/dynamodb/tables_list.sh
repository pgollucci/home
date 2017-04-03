aws_dynamodb_tables_list() {
    shift 0

    log_and_run aws dynamodb list-tables "$@"
}
